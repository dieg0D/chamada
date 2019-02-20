class CreateJoinTableUserType < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :types do |t|
      t.index [:user_id, :type_id]
      t.index [:type_id, :user_id]
    end
  end
end
