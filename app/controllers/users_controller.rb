class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create]
  before_action :require_login, only: [:updated_at]

     # register a new user
     def create
        user = User.create!(user_params)
        if user.valid?
          payload = {user_id: user.id}
          token = encode_token(payload)
          render json: {user: user, include: [jwt: token]}, status: :ok

          #wrap in if/else to handle errors
          # UserMailer.with(user: user).welcome_email.deliver_now

        else
          render json: {"error:" => "you're hitting this error on signup"}, status: :not_acceptable
          #errors: user.errors.full_messages
        end
        
      end

      def updated_at
      end

      private

      def user_params
        params.permit(:username, :password, :email)
      end

end
