Rails.application.routes.draw do

  get 'landing_page/index'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users



  resources :hosting_institutions do
    resources :competitions
  end

  resources :competitions do
    resources :datasets
    resources :timelines
  end

  resources :datasets do
    resources :dataset_files
  end


  resources :submissions
  resources :teams

  root to: 'landing_page#index', as: '/'

end
