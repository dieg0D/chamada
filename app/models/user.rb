class User < ApplicationRecord
	has_many :status
 	has_many :attendance_list, through: :status
end
