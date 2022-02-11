class UserRelation < ApplicationRecord

    belongs_to :user
    belongs_to :user2, class_name: "User"

    validates :user_id, :user2_id, presence: true
end
