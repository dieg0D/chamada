class AttendanceList < ApplicationRecord
    belongs_to :type
    has_many :status, dependent: :destroy 
 	has_many :user, through: :status
end
