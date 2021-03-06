Rails.application.routes.draw do
  # get 'admin/index'
  # get 'admin/update'

  devise_for :owners, :controllers => { :omniauth_callbacks => "owners/omniauth_callbacks" }
  get 'apartments/all_map_locations'

  # devise_scope :owner do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_owner_session
  # end

  resources :apartments do
    get 'map_location'
    get 'search', on: :collection
  end

  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"

  root 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
