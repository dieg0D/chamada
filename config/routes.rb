Rails.application.routes.draw do
  
  concern :with_datatable do
    post 'datatable', on: :collection
  end

  resources :types
  resources :users
  resources :attendance_lists, concerns: [:with_datatable]
  resources :status
  root :to =>'attendance_lists#index'

  get '/reger' => 'users#reger'
  get '/pt' => 'users#trainees'
  
  devise_for :admins, controllers: {:registrations => "admins/registrations", :sessions => "admins/sessions"}, :path_prefix => 'my'
  resources :admins
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
