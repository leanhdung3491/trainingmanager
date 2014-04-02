class RemoveEmailFromMemberClasses < ActiveRecord::Migration
  def change
    remove_column :member_classes, :email, :string
  end
end
