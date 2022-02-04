class UserRelationsController < ApplicationController

    before_action :authorized, only: [:updated_at]

    def follow
        #debugger
        follow = UserRelation.find_by(user_id: params[:user_id], user2_id: params[:user2_id])

        if follow
            render json: {"Message: " => "That relationship already exists!"}, status: :unprocessable_entity
        else
            new_follow = UserRelation.create!(follow_params)
            render json: new_follow, status: :created
        end
    end

    def existing_relations_following
        follows = UserRelation.where(:user_id=>params[:id])
        
        # loops through each relationship the currentUser has and finds the user record for user2_id
        user_follwing = []
        follows.each do |u|
            user_follwing << u.user2
        end
        
        render json: user_follwing, status: :ok
    end

    def existing_relations_followers
        followers = UserRelation.where(:user2_id=>params[:id])

        user_follwers = []
        followers.each do |u|
            user_follwers << u.user
        end
        
        render json: user_follwers, status: :ok
        
    end

    def return_user
        user = User.find_by_username(params[:id])
        if user
            render json: user, status: :ok
        else
            render json: {"message" => "That user does not exist!"}, status: :unprocessable_entity
        end
    end

    def updated_at
    end

    private

    def follow_params
        params.permit(:user_id, :user2_id, :rel_type)
    end
end
