class AddRoleToUser < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :role, null: false, foreign_key: true
  end
end
