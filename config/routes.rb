Rails.application.routes.draw do
  resources :rides
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "rides#index"
end
