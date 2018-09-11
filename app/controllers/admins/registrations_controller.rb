# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
     super
  end

  # POST /resource
   def create
    super
    #@admin = Admin.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation] )
    #@admin.save
   end
   
   def sign_up(resource_name, resource)
   end
   
  # GET /resource/edit
   def edit
     super
     #@admin = Admin.find(params[:format])
     #render action: 'edit'
      #Admin.find(params[:format]).render :edit
   end

  # PUT /resource
  # def update
  #   super
  # end

  def destroy
    Admin.find(params[:format]).destroy
    redirect_to root_path
    #redirect_back(fallback_location: fallback_location)
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end