class AdminMailer < ApplicationMailer
  default :from => 'phamthimaituyet00@gmail.com'

  def post_email(user)
    @user = user
    mail :to => user.email, :subject => "Tu choi bai post"
  end

  def user_email(user)
    @user = user
    mail :to => user.email, :subject => "Chuc mung sinh nhat!"
  end


end
