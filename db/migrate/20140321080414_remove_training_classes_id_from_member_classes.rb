class RemoveTrainingClassesIdFromMemberClasses < ActiveRecord::Migration
  def change
    remove_column :member_classes, :training_classes_id, :integer
  end
end
