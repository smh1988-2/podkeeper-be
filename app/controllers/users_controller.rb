class UsersController < ApplicationController

  skip_before_action :require_login, only: [:create]

     # register a new user
     def create
        user = User.create!(user_params)
        if user.valid?
          payload = {user_id: user.id}
          token = encode_token(payload)
          render json: {user: user, jwt: token}, status: :ok
        else
          render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
      end

      # # log in as an existing user
      # def login
      #   @user = User.find_by(username: params[:username])
    
      #   if @user && @user.authenticate(params[:password])
      #     token = encode_token({user_id: @user.id})
      #     render json: {user: @user, token: token}
      #   else
      #     render json: {error: "Invalid username or password!!!"}, status: :unprocessable_entity
      #   end
      # end

      # def auto_login
      #   if logged_in_user
      #     render json: {user: @user}
      #   else
      #     render json: {errors: "No user logged in."}
      #   end
      # end

      private

      def user_params
        params.permit(:username, :password)
      end

end
