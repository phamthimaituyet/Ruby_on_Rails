class AdminMailer < ApplicationMailer
  default :from => 'phamthimaituyet00@gmail.com'

  def welcome_email(user)
    # @url  = 'http://example.com/login'
    @user = user
    mail :to => user.email, :subject => "We've received your email"
  end
end
