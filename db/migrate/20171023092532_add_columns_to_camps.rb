class AddColumnsToCamps < ActiveRecord::Migration[5.1]
  def change
    add_column :camps, :start_date, :datetime
    add_column :camps, :end_date, :datetime
  end
end
