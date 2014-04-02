class AddTrainingClassesIdToMemberClasses < ActiveRecord::Migration
  def change
    add_column :member_classes, :training_classes_id, :interger
  end
end
