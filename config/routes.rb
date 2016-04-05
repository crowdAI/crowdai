Rails.application.routes.draw do

  resources :downloads
  get 'markdown_editor/create'

  get 'markdown_editor/show'

  resources :posts
  resources :topics
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users, except: [:update]
  resources :users, only: [:show, :edit, :update, :destroy]

  # Administrate
  namespace :admin do
    resources :users
    resources :competitions
    resources :dataset_files
    resources :hosting_institutions
    resources :submissions
    resources :submission_files
    resources :teams
    resources :team_users
    resources :timelines
    resources :user_competitions
    resources :topics
    root to: "users#index"
  end

  get 'landing_page/index'

  resources :hosting_institutions do
    resources :competitions
  end

  resources :competitions do
    resources :dataset_files
    resources :timelines
    resources :submissions
    resources :leaderboards, only: [:index]
    resources :topics
  end

  resources :topics do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end


  # resources :teams

  # different home for public / auth users
  authenticated :user do
    root to: 'competitions#index', as:'/'
  end
  root to: 'landing_page#index', as: '/'

end
