class CreateNotificationReceivers < ActiveRecord::Migration
  def change
    create_table :notification_receivers do |t|
      t.integer :notification_id
      t.integer :receiver_id
      t.string :status
      t.references :notification, index: true

      t.timestamps
    end
  end
end
