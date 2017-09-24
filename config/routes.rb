Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resources :reports 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'reports#index'
  post '/create', to: 'reports#create'


end
