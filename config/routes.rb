Rails.application.routes.draw do

  root 'pages#index'

  resources :users do
    resources :fly_boxes
    resources :flies
  end

  get 'terms' => 'pages#terms', as: :terms
  get 'about' => 'pages#about', as: :about

  get 'signup' => 'registrations#new', as: :signup
  post 'signup' => 'registrations#create'

  get 'signin' => 'authentication#new', as: :signin
  post 'signin' => 'authentication#create'
  get 'signout' =>'authentication#destroy', as: :signout

end
