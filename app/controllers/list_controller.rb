class ListController < ApplicationController

	def index
		
	end

	def lista
		@admins = Admin.all
	end
end
