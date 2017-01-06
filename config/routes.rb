Rails.application.routes.draw do
  resources :clientes, :produtos, :produto_tipos

  get 'welcome/index'
  post 'welcome/index'

  root 'welcome#index'
end
