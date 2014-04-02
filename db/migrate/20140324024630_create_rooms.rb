class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :building_id
      t.string :status

      t.timestamps
    end
  end
end
