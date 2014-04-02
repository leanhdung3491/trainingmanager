class AddEndTimeToTsessions < ActiveRecord::Migration
  def change
    add_column :tsessions, :end_time, :datetime
  end
end
