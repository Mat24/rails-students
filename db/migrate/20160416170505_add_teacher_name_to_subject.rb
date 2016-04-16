class AddTeacherNameToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :teacher_name, :string
  end
end
