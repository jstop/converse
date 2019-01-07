Rails.application.routes.draw do
  resources :categories
  resources :schedule_zones
  resources :programs do
    post :subscribe, on: :member
  end
  resources :tasks do
    post :complete, on: :member
  end

  devise_for :users
  get :protected, to: 'users#protected'
  get '/routines/schedule' => 'routines#schedule'
  resources :routines
  resources :recurring_events
  resources :events
  resources :time_logs
  resources :users
  #root 'visitors#index'
  root to: 'routines#index'
end
