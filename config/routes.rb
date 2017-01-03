Rails.application.routes.draw do
  resources :clientes
  get 'welcome/index'

  root 'welcome#index'
end
