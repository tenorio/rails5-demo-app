Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :clientes, :produtos, :sessions, :tipos, :users

  get 'welcome/index'
  post 'welcome/index'

  root 'welcome#index'
end
