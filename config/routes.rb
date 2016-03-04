Rails.application.routes.draw do

  resources :users
  namespace :admin do
    resources :users
resources :competitions
resources :datasets
resources :dataset_files
resources :hosting_institutions

resources :teams
resources :team_users
resources :timelines
resources :user_competitions

    root to: "users#index"
  end

  get 'landing_page/index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users

  resources :hosting_institutions do
    resources :competitions
    end

  resources :competitions do
    resources :datasets
    resources :timelines
    resources :submissions
  end

  resources :submissions do
    resources :submission_files
  end

  resources :datasets do
    resources :dataset_files
  end

  resources :teams

  root to: 'landing_page#index', as: '/'

end
