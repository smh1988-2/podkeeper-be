class UserMailer < ApplicationMailer
    default from: 'seanmhurley1988@gmail.com'

    def welcome_email
        @user = params[:user]
        @url  = 'http://www.podkeeper.live/'
        mail(to: @user.email, subject: 'Welcome to Podkeeper')
      end


end
