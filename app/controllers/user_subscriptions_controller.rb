class UserSubscriptionsController < ApplicationController

    before_action :authorized, only: [:updated]

    def create
        subscription = UserSubscription.find_by(user_id: params[:user_id], podcast_id: params[:podcast_id])
        if subscription
            render json: {"Message: " => "You've already subscribed to this podcast!"}, status: :unprocessable_entity
        else
            new_subscription = UserSubscription.create!(subscription_params)
            # create new activity too
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
