Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'dashboard#index'

  get 'login', to: 'users#new'
  post 'login', to: 'users#login'

  get 'register', to: 'users#register'
  post 'register', to: 'users#create'

  delete 'logout', to: 'users#logout'

  get 'new', to: 'dashboard#new'
  post 'create', to: 'dashboard#create'
  get 'post/:id', to: 'dashboard#show', as: 'show'
  get 'edit/:id', to: 'dashboard#edit', as: 'edit'
  patch 'update/:id', to: 'dashboard#update', as: 'update'
  delete 'destroy/:id', to: 'dashboard#destroy', as: 'destroy'

end
