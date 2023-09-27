class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    # binding.pry
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def new_post_email(post)
    # binding.pry
    @post = post
    mail(to: 'recipient@example.com', subject: 'New Post Created')
  end
end
