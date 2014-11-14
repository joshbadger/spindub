Rails.application.routes.draw do
  resources :flies, :users
  root 'pages#index', as: :home
end
