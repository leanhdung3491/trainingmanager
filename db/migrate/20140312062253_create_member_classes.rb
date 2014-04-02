class CreateMemberClasses < ActiveRecord::Migration
  def change
    create_table :member_classes do |t|
      t.string :full_name
      t.date :birthday
      t.string :email

      t.timestamps
    end
  end
end
