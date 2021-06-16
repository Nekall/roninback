class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    @user = current_user
    render json: { message: 'Signed up sucessfully.', email: @user.email, id: @user.id}, status: :ok
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end
