class CreateCamps < ActiveRecord::Migration[5.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.integer :campus_id
      t.string :img_url
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps null: false
    end
  end
end
