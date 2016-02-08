Rails.application.routes.draw do

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

end
