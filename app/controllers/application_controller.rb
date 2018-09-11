class ApplicationController < ActionController::Base
	before_action :is_admin

	def is_admin
		if !current_admin
			if request.env['PATH_INFO'] != "/admins/sign_in" && request.env['PATH_INFO'] != "/admins/sign_up" 
				redirect_to new_admin_session_path
			end
		end
	end
end
