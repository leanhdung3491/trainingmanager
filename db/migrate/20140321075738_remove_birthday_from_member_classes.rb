class RemoveBirthdayFromMemberClasses < ActiveRecord::Migration
  def change
    remove_column :member_classes, :birthday, :date
  end
end
