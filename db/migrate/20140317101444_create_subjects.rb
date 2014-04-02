class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.string :subject_code
      t.string :description
      t.integer :category_id
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
