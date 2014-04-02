class RemoveEndTimeFromTsessions < ActiveRecord::Migration
  def change
    remove_column :tsessions, :end_time, :date
  end
end
