class PasswordController < ApplicationController

  def forgot
    if params[:email].blank?
      return render json: { message: 'Email not present'}
    end

    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_password_token!
      UserMailer.forgot_password_email(user).deliver_now
      render json: { message: "Email de réinitialisation envoyé." }, status: :ok
    else
      render json: { message: "Adresse mail inconnue." }, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s
    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: user, status: :ok
      else
        render json: {message: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Le lien n'est pas valide ou a expiré." }, status: :unprocessable_entity
    end
  end

end
