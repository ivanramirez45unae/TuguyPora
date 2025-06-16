Rails.application.routes.draw do
  get "mi_perfil", to: "perfil#show", as: "mi_perfil"
  devise_for :users

  resources :solicitudes, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :donantes, only: [ :index, :new, :create, :edit, :update ]
  resources :donaciones, only: [ :index, :show ]
  resources :postulaciones, only: [ :new, :create ] do
    resources :donaciones, only: [ :new, :create ]
  end

resources :donaciones, only: [ :show ]

  root "home#redirect_user"

  namespace :users do
    get "dashboard", to: "dashboard#index"
  end

  namespace :centros do
    get "dashboard", to: "dashboard#index"
  end
end
