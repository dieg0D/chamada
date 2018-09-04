class Status < ApplicationRecord
	belongs_to :user
  	belongs_to :attendance_list
end
