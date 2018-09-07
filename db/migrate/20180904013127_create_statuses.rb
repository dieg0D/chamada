class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|	

      t.belongs_to :user, index: true
      t.belongs_to :attendance_list, index: true
      t.string :state
      t.timestamps

    end
  end
end
