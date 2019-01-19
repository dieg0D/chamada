Rails.application.routes.draw do
  
  get 'admins/index'
  get 'admins/new'
  get 'admins/edit'
  resources :types
  resources :users
  resources :attendance_lists
  resources :status
  root :to =>'attendance_lists#index'

  get '/reger' => 'users#reger'
  get '/pt' => 'users#trainees'
  
  devise_for :admins, controllers: {:registrations => "admins/registrations"}, :path_prefix => 'my'
  resources :admins
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
