Rails.application.routes.draw do
  resources :attendance_lists
  root :to =>'attendance_lists#index'
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
