Rails.application.routes.draw do
  get "solicitudes/index"
  get "solicitudes/new"
  get "solicitudes/create"
  devise_for :users
  # Ruta para las solicitudes
  resources :solicitudes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  root "home#index"
end
