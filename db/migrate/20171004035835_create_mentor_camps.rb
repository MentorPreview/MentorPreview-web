class CreateMentorCamps < ActiveRecord::Migration[5.1]
  def change
    create_table :mentor_camps do |t|
      t.integer :camp_id
      t.integer :mentor_id
      t.timestamps null: false
    end
  end
end
