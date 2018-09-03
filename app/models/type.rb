class Type < ApplicationRecord
    has_many :attendance_lists, dependent: :destroy 
end
