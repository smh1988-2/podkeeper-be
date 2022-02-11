class UserMailer < ApplicationMailer
    default from: 'seanmhurley1988@gmail.com'

    def welcome_email
        @user = params[:user]
        @url  = 'http://localhost:3001/home'
        mail(to: @user.email, subject: 'Welcome to Podkeeper')
      end


end
