class User < ApplicationRecord
    has_secure_password

    has_many :user_relations
    has_many :user_subscriptions
    has_many :user_activities

    validates :username, presence: true, uniqueness: true
    validates :first_name, :last_name, presence: true
    #validates :password, length: { in: 3..20, message: "Password should be between 3 and 20 characters." }   

end
