Rails.application.routes.draw do
  resources :competitions
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users


  resources :hosting_institutions

end
