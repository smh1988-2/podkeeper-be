class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create]

     # register a new user
     def create
        user = User.create!(user_params)
        if user.valid?
          payload = {user_id: user.id}
          token = encode_token(payload)
          render json: {user: user, include: [jwt: token]}, status: :ok

          UserMailer.with(user: user).welcome_email.deliver_now
          # format.html { redirect_to(user, notice: 'User was successfully created.') }

        else
          render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end

          #wrap is if/else to handle errors

          

          # #format.json { render json: user, status: :created, location: user }
        
      end

      private

      def user_params
        params.permit(:username, :password, :email)
      end

end
