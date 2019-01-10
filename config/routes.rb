Rails.application.routes.draw do
  resources :time_trials 
  post '/time_trials/contestants' => 'time_trials#contestants'
  get '/admin' => 'time_trials#admin'
  root :to => "time_trials#admin"
end
