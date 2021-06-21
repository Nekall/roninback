class UserMailer < ApplicationMailer
  default from: 'ronincode.noreply@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://ronincode.fr/login'
    mail(to: @user.email, subject: 'Bienvenue chez 浪漫コード RoninCode !')
  end

end
