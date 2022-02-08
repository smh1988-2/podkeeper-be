class UserSubscription < ApplicationRecord

    belongs_to :user
    belongs_to :podcast

    validates :user_id, :podcast_id, presence: true
end
