Rails.application.routes.draw do

  root 'pages#index'

  resources :flies, :users

  get 'signup' => 'registrations#new', as: :signup
  post 'signup' => 'registrations#create'

  get 'signin' => 'authentication#new', as: :signin
  post 'signin' => 'authentication#create'
  get 'signout' =>'authentication#destroy', as: :signout

end
