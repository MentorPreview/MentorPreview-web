class CreateCourseType < ActiveRecord::Migration[5.1]
  def change
    create_table :course_types do |t|
      t.integer :name
      t.integer :course_id
      t.timestamps null: false
    end
  end
end
