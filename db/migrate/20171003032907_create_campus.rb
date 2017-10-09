class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.string :official_name
      t.string :common_name
      t.string :university_name
      t.string :campus_name
      t.string :postal_code
      t.string :address
      t.float :lat
      t.float :lng
      t.string :img_url
      t.timestamps null: false
    end
  end
end
