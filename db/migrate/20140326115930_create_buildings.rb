class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :building_name
      t.float :latitute
      t.float :longitude
      t.string :description
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
