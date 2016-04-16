class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.text :subject_description
      t.decimal :exam_1, deafult: 0.0
      t.decimal :exam_2, deafult: 0.0
      t.decimal :exam_3, deafult: 0.0
      t.decimal :exam_average
      t.timestamps null: false
    end
  end
end
