Rails.application.routes.draw do
  devise_for :users
  root to: 'buoys#index'
  get '/design', to: 'pages#design'
  get '/pages/home', to: 'pages#home'
  get '/mybuoys', to: 'buoys#mybuoys'

  resources :buoys, only: [:index, :new, :create, :show, :update, :destroy] do
    resources :bookings, only: [:new, :create]
      end
  resources :bookings, only: [:index ]
  put 'bookings/:id/confirm', to: 'bookings#confirm', as: 'confirm_booking'
  put 'bookings/:id/reject', to: 'bookings#reject', as: 'reject_booking'
end
