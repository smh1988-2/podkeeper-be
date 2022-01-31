class UserRelationsController < ApplicationController

    before_action :authorized, only: [:auto_login]

    def follow
        follow = UserRelation.find_by(user_id: params[:user_id], user2_id: params[:user2_id])
        if follow
            render json: {"Message: " => "That relationship already exists!"}, status: :unprocessable_entity
        else
            new_follow = UserRelation.create!(follow_params)
            render json: new_follow, status: :created
        end
        
        
    end

    private

    def follow_params
        params.permit(:user_id, :user2_id, :type)
    end
end
