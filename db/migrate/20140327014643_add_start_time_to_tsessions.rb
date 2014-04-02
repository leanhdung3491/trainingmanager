class AddStartTimeToTsessions < ActiveRecord::Migration
  def change
    add_column :tsessions, :start_time, :datetime
  end
end
