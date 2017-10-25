class AddIdentifierToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :identifier, :string
  end
end
