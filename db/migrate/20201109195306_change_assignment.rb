class ChangeAssignment < ActiveRecord::Migration
  def change
    rename_column :assignments, :student_id, :user_id
  end
end
