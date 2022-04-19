class AdminMailer < ApplicationMailer
  default :from => 'phamthimaituyet00@gmail.com'

  def welcome_email(post)
    # @url  = 'http://example.com/login'
    @post = post
    mail :to => post.user.email, :subject => "We've received your email"
  end
end
