class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if(current_user.nil?)
      render json: { message: "Échec de la connexion." }, status: :unauthorized
    else
      @user = current_user
      render json: { message: "Vous êtes connecté.", id: @user.id, is_admin: @user.is_admin }, status: :ok
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "Vous êtes déconnecté." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Désolé, vous n’êtes pas autorisé à faire ceci."}, status: :unauthorized
  end
end
