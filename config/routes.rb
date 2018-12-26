Rails.application.routes.draw do
  resources :schedule_zones
  resources :programs
  resources :tasks
  devise_for :users
  get :protected, to: 'users#protected'
  get '/routines/schedule' => 'routines#schedule'
  resources :routines
  resources :recurring_events
  resources :events
  resources :users
  #root 'visitors#index'
  root to: 'routines#index'
end
