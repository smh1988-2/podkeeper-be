class Podcast < ApplicationRecord

    has_many :user_subscriptions
    has_many :user_activities
    
end
