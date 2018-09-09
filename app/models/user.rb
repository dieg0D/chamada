class User < ApplicationRecord
	has_many :status, dependent: :destroy 
 	has_many :attendance_list, through: :status

 	validates :nome, presence: true
 	validates :email, presence: true, uniqueness: true
end
