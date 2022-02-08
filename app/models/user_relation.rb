class UserRelation < ApplicationRecord
    #belongs_to :user

    # has_many :user_relations
    # has_many :other_users, class_name: "User", foreign_key: "user2_id"

    belongs_to :user
    belongs_to :user2, class_name: "User"


    validates :user_id, :user2_id, presence: true
end
