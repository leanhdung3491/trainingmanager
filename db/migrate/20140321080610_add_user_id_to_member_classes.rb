class AddUserIdToMemberClasses < ActiveRecord::Migration
  def change
    add_column :member_classes, :user_id, :integer
  end
end
