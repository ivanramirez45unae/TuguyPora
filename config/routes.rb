Rails.application.routes.draw do
  devise_for :users

  resources :solicitudes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :postulaciones, only: [ :new, :create ]
  resources :donantes, only: [ :new, :create ]

  root "home#index"
end
