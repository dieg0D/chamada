class AddNucleoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nucleo, :string
  end
end
