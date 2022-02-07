class UserActivitiesController < ApplicationController

    before_action :authorized, only: [:updated_at]

    def my_activities
        activities = UserActivity.where(user_id: params[:id])

        render json: activities, include: [:podcast, :episode], status: :ok
    end

    def listened
        listened = UserActivity.create!(activity_params)
        render json: listened, status: :ok
    end

    def rating
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

    def updated_at
    end

    private

    def activity_params
        params.permit(:user_id, :episode_id, :podcast_id, :activity_type, :rating, :review, :status)
    end

end
