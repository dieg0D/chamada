Rails.application.routes.draw do
  root "list#index"
  #root :to => redirect("/admins/sign_in")
  devise_for :admins
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
