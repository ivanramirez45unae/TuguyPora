Rails.application.routes.draw do
  namespace :admin do
    get "dashboard/index"
  end
  get "informacion", to: "pages#informacion"
  get "mi_perfil", to: "perfil#show", as: "mi_perfil"
  devise_scope :user do
    get "/logout", to: "devise/sessions#destroy"
  end


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
    get "perfil", to: "perfil#show", as: :perfil
  end


  namespace :admin do
    resources :users do
      patch :deactivate, on: :member
    end
    get "dashboard", to: "dashboard#index", as: :dashboard
  end
end
