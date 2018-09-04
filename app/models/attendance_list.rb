class AttendanceList < ApplicationRecord
    belongs_to :type
    has_many :status
 	has_many :user, through: :status
end
