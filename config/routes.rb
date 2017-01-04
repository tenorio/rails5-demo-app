Rails.application.routes.draw do
  resources :clientes, :produtos

  get 'welcome/index'

  root 'welcome#index'
end
