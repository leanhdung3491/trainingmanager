class RemoveFullNameFromMemberClasses < ActiveRecord::Migration
  def change
    remove_column :member_classes, :full_name, :string
  end
end
