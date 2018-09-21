Rails.application.routes.draw do
  
  resources :types
  resources :users
  resources :attendance_lists
  resources :status
  root :to =>'attendance_lists#index'

  get '/reger' => 'users#reger'
  get '/pt' => 'users#trainees'
  get '/c_reger' => 'users#c_reger'
  get '/c_pt' => 'users#c_trainees'
  

  get "/admins_list" => "list#lista"
  devise_for :admins, controllers: {:registrations => "admins/registrations"}
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
