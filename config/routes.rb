Rails.application.routes.draw do
  root "list#index"
  
  devise_for :admins, controllers: {:registrations => "admins/registrations"}
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
