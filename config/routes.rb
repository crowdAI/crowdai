require 'sidekiq/web'

Rails.application.routes.draw do

  admin = lambda do |request|
    request.env['warden'].authenticate? && request.env['warden'].user.admin?
  end

  constraints admin do
    mount Sidekiq::Web => '/sidekiq'
    ActiveAdmin.routes(self)
  end

  get 'markdown_editor/create'
  get 'markdown_editor/show'

  #devise_for :participants
  devise_for :participants #, ActiveAdmin::Devise.config
  #ActiveAdmin.routes(self)
  resources :participants, only: [:show, :edit, :update, :destroy] do
    get :sync_mailchimp
    get :regen_api_key
    resources :email_preferences, only: [:edit, :update]
  end


  # API
  namespace :api do
    resources :submissions, only: [:update]
    resources :external_graders, only: [:update, :show]
    resources :docker_callbacks, only: [:create]
  end

  get 'markdown_editor/show'

  resources :landing_page, only: [:index]

  resources :organizers do
    resources :challenges
    get :regen_api_key
  end

  resources :challenges do
    resources :dataset_files, except: [:show, :update, :edit]
    resources :events
    resources :submissions do
      get :grade
      get :hub
      get :execute
    end
    resources :leaderboards, only: [:index]
    resources :topics
    resources :docker_configurations
    get :regrade
  end

  resources :docker_configurations do
    resources :container_instances
  end

  resources :docker_configurations do
    resources :docker_files, except: [:index, :show]
  end

  resources :container_instances do
    resources :container_logs, only: [:index, :show, :destroy]
  end

  resources :dataset_files, except: [:show] do
    resources :dataset_file_downloads, only: [:create]
  end

  resources :topics do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts do
    resources :votes, only: [:create, :destroy]
  end

  resources :submissions do
    resources :votes, only: [:create, :destroy]
    resources :container_instances
  end

  resources :articles do
    resources :article_sections
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  match '/pages/contact', to: 'pages#contact', via: :get
  match '/pages/privacy', to: 'pages#privacy', via: :get
  match '/pages/terms',   to: 'pages#terms', via: :get


  get '/pages/*id' => 'pages#show', as: :page, format: false

  match '*path', to: 'errors#e404', via: :all

  root 'landing_page#index'
end
