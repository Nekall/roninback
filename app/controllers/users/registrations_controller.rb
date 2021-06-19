class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    @user = current_user
    render json: { message: "Inscription réussie.", email: @user.email, id: @user.id}, status: :ok
  end

  def register_failed
    render json: { message: "Il y a eu un problème." }
  end

end
