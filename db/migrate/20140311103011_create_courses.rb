class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :description
      t.integer :duration
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
