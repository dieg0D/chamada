Rails.application.routes.draw do
  resources :users
  resources :attendance_lists
  root :to =>'attendance_lists#index'

  get '/reger' => 'users#reger'
  get '/pt' => 'users#trainees'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
