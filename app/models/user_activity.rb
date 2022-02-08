class UserActivity < ApplicationRecord

    belongs_to :user
    belongs_to :podcast
    belongs_to :episode, optional: true
    
end
