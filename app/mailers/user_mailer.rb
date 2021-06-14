class UserMailer < ApplicationMailer
  default from: 'no-reply@ronincode.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    #on définit une variable @url qu'on utilisera dans la view d'e-mail
    @url = 'http://ronincode.fr/login'
    # c'est cet appel à mail() qui permet d'envoyer l'e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez 浪漫コード RoninCode !')
  end

end
