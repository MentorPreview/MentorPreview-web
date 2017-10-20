class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :url
      t.timestamps null: false
    end
  end
end
