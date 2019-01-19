Rails.application.routes.draw do
  
  resources :types
  resources :users
  resources :attendance_lists
  resources :status
  root :to =>'attendance_lists#index'

  get '/reger' => 'users#reger'
  get '/pt' => 'users#trainees'
  
  devise_for :admins, controllers: {:registrations => "admins/registrations", :sessions => "admins/sessions"}, :path_prefix => 'my'
  resources :admins
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
