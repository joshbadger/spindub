  Rails.application.routes.draw do

  resources :flies
  root 'pages#index', as: :home

end
