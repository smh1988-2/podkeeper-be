class UserActivitiesController < ApplicationController

    before_action :authorized

    def my_activities
        activities = UserActivity.where(user_id: params[:id])

        render json: activities, include: [:podcast, :episode], status: :ok
    end

    def listened
        listened = UserActivity.create!(activity_params)
        render json: listened, status: :ok
    end

    private

    def activity_params
        params.permit(:user_id, :episode_id, :podcast_id, :activity_type, :rating, :review, :status)
    end

end
