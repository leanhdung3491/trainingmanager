class MemberClass < ActiveRecord::Base
	belongs_to :user
	#validates :user_id,# presence: true,
     #                  uniqueness: {case_sensitive:false, message: "This member was added" }
end
