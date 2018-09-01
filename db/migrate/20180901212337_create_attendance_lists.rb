class CreateAttendanceLists < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_lists do |t|
      t.date :data
      t.string :description

      t.timestamps
    end
  end
end
