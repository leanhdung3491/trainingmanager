class Tsession < ActiveRecord::Base
  belongs_to :training_class
  belongs_to :user
  belongs_to :room
  belongs_to :subject
  belongs_to :member_class
end
