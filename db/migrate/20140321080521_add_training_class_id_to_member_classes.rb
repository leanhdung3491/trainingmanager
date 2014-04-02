class AddTrainingClassIdToMemberClasses < ActiveRecord::Migration
  def change
    add_column :member_classes, :training_class_id, :integer
  end
end
