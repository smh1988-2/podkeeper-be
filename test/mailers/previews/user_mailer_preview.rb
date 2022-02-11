# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
        # Set up a temporary order for the preview

        user = User.new(username: "Sean", email: "smh1988@gmail.com")
    
    
        UserMailer.with(user: user).welcome_email
      end
    
end
