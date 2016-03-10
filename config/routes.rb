Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users, except: [:update]
  resources :users, only: [:show, :edit, :update, :destroy]

  # Administrate
  namespace :admin do
    resources :users
    resources :competitions
    resources :datasets
    resources :dataset_files
    resources :hosting_institutions
    resources :submissions
    resources :submission_files
    resources :teams
    resources :team_users
    resources :timelines
    resources :user_competitions
    root to: "users#index"
  end

  get 'landing_page/index'



  resources :hosting_institutions do
    resources :competitions
  end

  resources :competitions do
    resources :datasets
    resources :timelines
    resources :submissions
    resources :leaderboards, only: [:index, :show]
  end

  resources :datasets do
    resources :dataset_files
  end



  # resources :teams

  root to: 'landing_page#index', as: '/'

end
