class CreateTrainingClasses < ActiveRecord::Migration
  def change
    create_table :training_classes do |t|
      t.string :class_name
      t.date :start_date
      t.date :end_date
      t.references :course, index: true
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
