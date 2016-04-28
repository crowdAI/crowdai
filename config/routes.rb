require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  get 'markdown_editor/create'
  get 'markdown_editor/show'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :participants
  resources :participants, only: [:show, :edit, :update, :destroy]

  # Administrate
  namespace :admin do
    resources :participants
    resources :challenges
    resources :dataset_files
    resources :organizers
    resources :submissions
    resources :submission_files
    resources :teams
    resources :posts
    resources :team_participants
    resources :timelines
    resources :topics
    root to: 'participants#index'
  end

  # API
  namespace :api do
    namespace :v1 do
      resources :submissions, only: [:update]
    end
  end

  get 'markdown_editor/create'
  get 'markdown_editor/show'

  get 'landing_page/index'  # TODO refactor

  resources :organizers do
    resources :challenges
  end

  resources :challenges do
    resources :dataset_files
    resources :timelines
    resources :submissions, except: [ :edit, :update ]
    resources :leaderboards, only: [:index]
    resources :topics
  end

  resources :topics do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  get '/pages/*id' => 'pages#show', as: :page, format: false
  resources :teams

  # different home for public / auth users
  authenticated :participant do
    root 'challenges#index', as: :authenticated_root
  end
  unauthenticated :participant do
    root 'landing_page#index', as: :unauthenticated_root
  end
end
