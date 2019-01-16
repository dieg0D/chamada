class User < ApplicationRecord
	has_many :status, dependent: :destroy 
	has_many :attendance_list, through: :status
	 
	has_and_belongs_to_many :types

 	validates :nome, presence: true
 	validates :email, presence: true, uniqueness: true
end
