class User < ApplicationRecord
	has_many :status, dependent: :destroy 
 	has_many :attendance_list, through: :status
end
