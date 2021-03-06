class UserMailer < ApplicationMailer
  default from: 'ronincode.noreply@gmail.com'

  layout "mailer"

  def welcome_email(user)
    @user = user
    @url = 'https://ronincode.vercel.app/se-connecter'
    mail(to: @user.email, subject: 'Bienvenue chez RoninCode !')
  end

  def forgot_password_email(user)
    @user = user
    @url  = 'https://ronincode.vercel.app/nouveau/mot-de-passe/'
    mail(to: @user.email, subject: 'RĂ©initialisation du mot de passe pour RoninCode')
  end

end
