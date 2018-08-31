class ListController < ApplicationController

	def index
		
	end

	def list
		@admins = Admin.all
	end
end
