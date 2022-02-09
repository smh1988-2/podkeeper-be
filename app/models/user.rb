class User < ApplicationRecord
    has_secure_password

    has_many :user_relations
    has_many :other_user_relations, class_name: "User", foreign_key: "user2_id"
    has_many :user_subscriptions
    has_many :user_activities

    validates :username, presence: true, uniqueness: true
   
    #validates :password, length: { in: 3..20, message: "Password should be between 3 and 20 characters." }

end
