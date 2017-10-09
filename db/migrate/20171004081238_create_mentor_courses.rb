class CreateMentorCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :mentor_courses do |t|
      t.integer :course_id
      t.integer :mentor_id
      t.timestamps null: false
    end
  end
end
