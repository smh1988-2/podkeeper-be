class UserRelation < ApplicationRecord
    belongs_to :user

    validates :user_id, :user2_id, presence: true
end
