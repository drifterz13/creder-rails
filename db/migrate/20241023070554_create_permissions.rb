class CreatePermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :permissions do |t|
      t.integer :permit
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
