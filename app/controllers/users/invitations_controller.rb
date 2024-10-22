class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def invite_resource
    super
    flash[:notice] = "User has been invited successfully"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [
      :first_name, :last_name
    ])
  end
end
