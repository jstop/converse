Rails.application.routes.draw do
  resources :schedule_zones
  resources :programs do
    post :subscribe, on: :member
  end
  #post '/programs/subscribe/:id', to: 'programs#subscribe'
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
