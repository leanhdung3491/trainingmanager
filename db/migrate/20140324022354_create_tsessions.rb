class CreateTsessions < ActiveRecord::Migration
  def change
    create_table :tsessions do |t|
      t.integer :training_class_id
      t.integer :subject_id
      t.integer :room_id
      t.integer :user_id
      t.date :start_time
      t.date :end_time
      t.string :status
      t.references :training_class, index: true
      t.references :user, index: true
      t.references :room, index: true
      t.references :subject, index: true
      t.references :member_class, index: true

      t.timestamps
    end
    change_table :tsessions do |t|
      t.date :start_time
      t.time :start_time
    end
    change_table :tsessions do |t|
      t.date :end_time
      t.time :end_time
    end
    change_table :tsessions do |t|
      t.time :start_time
      t.datetime :start_time
    end
    change_table :tsessions do |t|
      t.time :end_time
      t.datetime :end_time
    end
  end
end
