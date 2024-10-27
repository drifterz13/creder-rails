class CreateCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }
      t.text :description
      t.integer :grading_type, null: false

      t.timestamps
    end
  end
end
