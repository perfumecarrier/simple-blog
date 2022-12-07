Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#index'

  get 'login', to: 'users#new'
  post 'login', to: 'users#login'

  get 'register', to: 'users#register'
  post 'register', to: 'users#create'

  delete 'logout', to: 'users#logout'
end
