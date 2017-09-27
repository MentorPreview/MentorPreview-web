class CreateMentors < ActiveRecord::Migration[5.1]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :img_url
      t.timestamps null: false
    end
  end
end
