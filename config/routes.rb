Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: 'buoys#index'
  get '/design', to: 'pages#design'
  get '/pages/home', to: 'pages#home'
  resources :buoys, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index ] do
    resources :reviews, only: [:new]
  end
  put 'bookings/:id/confirm', to: 'bookings#confirm', as: 'confirm_booking'
  put 'bookings/:id/reject', to: 'bookings#reject', as: 'reject_booking'
end
