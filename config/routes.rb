Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :main, path: "/" do
    resource :dashboard, only: :show
    resources :products, only: [ :show ]
  end

  root to: "main/dashboards#index"
  get "catalog" => "main/dashboards#catalog"
  get "contact" => "main/dashboards#contact"
  get "cart" => "main/dashboards#cart"

  resources :categories, only: [ :show ] do
    resources :products, only: [ :index ]
  end
end
