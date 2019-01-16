class Type < ApplicationRecord
    has_many :attendance_lists, dependent: :destroy 
    has_and_belongs_to_many :users, dependent: :destroy
end
