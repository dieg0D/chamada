class AddTypeToAttendanceList < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_lists, :type, foreign_key: true
  end
end
