Rails.application.routes.draw do
  # get 'category_details/new'
  # get 'category_details/create'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/create'
  # get 'categories/destroy'
  devise_for :users

  # get 'splash_screen/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash_screen#index"
  resources :categories, only: [:index, :show, :new, :create, :destroy] do 
    resources :category_details, only: [:new, :create]
  end
end
