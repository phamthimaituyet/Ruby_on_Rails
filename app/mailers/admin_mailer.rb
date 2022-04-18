class AdminMailer < ApplicationMailer
  default :from => 'phamthimaituyet2000@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail :to => @user.email, :subject => "We've received your email"
  end
end
