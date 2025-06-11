Rails.application.routes.draw do
  get "mi_perfil", to: "perfil#show", as: "mi_perfil"
  devise_for :users

  resources :solicitudes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :postulaciones, only: [ :new, :create ]
  resources :donantes, only: [ :new, :create ]

  root "home#index"
end
