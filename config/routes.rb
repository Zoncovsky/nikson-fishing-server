Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  ActiveAdmin.routes(self)
  mount MissionControl::Jobs::Engine, at: '/jobs'

  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :main, path: '/' do
    resource :dashboard, only: :show
    resources :products, only: [:show]
    resources :orders
  end

  rot to: 'main/dashboards#index'
  get 'catalog' => 'main/dashboards#catalog'
  get 'contact' => 'main/dashboards#contact'
  get 'cart' => 'main/dashboards#cart'
  post 'checkout' => 'main/checkouts#create'

  resources :categories, only: [:show] do
    resources :products, only: [:index]
  end
end
