class DropProfilesTable < ActiveRecord::Migration[8.1]
  def change
    def up
      drop_table :profiles, force: :cascade
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
