class RemoveStartTimeFromTsessions < ActiveRecord::Migration
  def change
    remove_column :tsessions, :start_time, :date
  end
end
