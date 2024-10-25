class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_invite_path_for(resource)
    admin_users_path
  end

  def invite_resource
    invited_user = super
    flash[:notice] = "User has been invited successfully"
    invited_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [
      :first_name, :last_name, :role_id
    ])
  end
end
