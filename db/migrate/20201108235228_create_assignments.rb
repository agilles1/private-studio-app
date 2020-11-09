class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :student_id
      t.string  :content
      t.timestamps null: false
    end
  end
end
