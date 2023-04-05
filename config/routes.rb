Rails.application.routes.draw do
  devise_for :users

  get 'splash_screen/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash_screen#index"
end
