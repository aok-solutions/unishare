Rails.application.routes.draw do
  root to: "rides#index"

  resources :rides
  post 'join_ride/:ride' => 'rides#join_ride', as: :join_ride

  devise_for :users, controllers: { registrations: 'registrations' }
  get 'users/:id' => 'users#show', as: :view_profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
