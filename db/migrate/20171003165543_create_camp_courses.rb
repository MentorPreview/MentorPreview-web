class CreateCampCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :camp_courses do |t|
      t.integer :camp_id
      t.integer :course_id
      t.timestamps null: false
    end
  end
end
