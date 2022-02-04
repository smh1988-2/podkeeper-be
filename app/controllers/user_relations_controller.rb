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

    def existing_relations
        #the .first is wrong. how to return the user 2 for ALL existing relations???
        user2_info = User.find_by_id(UserRelation.first.user2_id)

        follows = UserRelation.where(:user_id=>params[:id])
        
        render json: follows, include: {"user"=>user2_info}, status: :ok
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
