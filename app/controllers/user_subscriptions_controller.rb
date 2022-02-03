class UserSubscriptionsController < ApplicationController

    before_action :authorized

    def create
        subscription = UserSubscription.find_by(user_id: params[:user_id], podcast_id: params[:podcast_id])

        if subscription
            render json: {"Message: " => "You've already subscribed to this podcast!"}, status: :unprocessable_entity
        else
            new_subscription = UserSubscription.create!(subscription_params)

            new_activity = UserActivity.create!(user_id: params[:user_id], podcast_id: params[:podcast_id], activity_type:params[:activity_type])

            render json: new_subscription, status: :created
        end
    end

    def updated
    end

    private

    def subscription_params
        params.permit(:user_id, :podcast_id, :podcast_rating)
    end
end
