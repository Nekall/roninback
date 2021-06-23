class UserMailer < ApplicationMailer
  default from: 'ronincode.noreply@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/se-connecter'
    mail(to: @user.email, subject: 'Bienvenue chez RoninCode !')
  end

  def forgot_password_email(user)
    @user = user
    @url  = 'http://localhost:3000/nouveau/mot-de-passe/'
    mail(to: @user.email, subject: 'Réinitialisation du mot de passe pour RoninCode')
  end

end
