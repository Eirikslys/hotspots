Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # With the routing below the page to create a new rental is accessed from the locations
  resources :locations, only [:index, :show, :new, :create] do
    resources :rentals, only [:new, :create]
  end

  # Custom path that creates a /dashboard page with a action in the pages controller.
  # Dashboard should let the user: See rentals of own locations, know what has been rented and know what the user is offering
  get '/dashboard', to: 'pages#dashboard'
end
