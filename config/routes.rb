Rails.application.routes.draw do
  resources :clientes, :produtos, :tipos

  get 'welcome/index'
  post 'welcome/index'

  root 'welcome#index'
end
