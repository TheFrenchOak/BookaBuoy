Rails.application.routes.draw do
  devise_for :users
  root to: 'buoys#index'
  get '/design', to: 'pages#design'
  resources :buoys, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :update]
end
