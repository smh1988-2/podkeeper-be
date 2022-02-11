class UserActivitiesController < ApplicationController

    before_action :require_login, only: [:updated_at]

    def my_activities
        activities = UserActivity.where(user_id: params[:id]).order(created_at: :desc)
        render json: activities, include: [:podcast, :episode], status: :ok
    end

    def listened
        listened = UserActivity.create!(activity_params)
        render json: listened, status: :ok
    end

    def rating #change this name
        rating = UserActivity.create!(activity_params)
        render json: rating, status: :ok
    end

    def podcast_rating
        rating = UserActivity.where(user_id: params[:user_id], podcast_id: params[:podcast_id]).order(created_at: :desc).limit(1)

        if rating
            render json: rating, status: :ok
        else
            render json: {"Message:" => "you haven't rated this podcast"}
        end
    end

    def friend_activity
        friends = UserRelation.where(user_id: params[:id])
        activity =[]
        friends.each { |friend| 
            activity << friend.user2.user_activities
            #.limit(2) <- limit the number of activities return for each user (maybe add type of activity logic in the backend rather than front?)
        }
        render json: activity, include: [:user, :podcast, :episode], status: :ok
    end

    def updated_at
    end

    private

    def activity_params
        params.permit(:user_id, :episode_id, :podcast_id, :activity_type, :rating, :review, :status)
    end

end
