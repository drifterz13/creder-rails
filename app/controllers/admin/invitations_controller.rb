class Admin::InvitationsController < ApplicationController
  def new
    @user = User.new
    @user.build_profile
  end

  def create
    User.invite!(invite_user_params)
    redirect_to admin_users_path, notice: "User has been invited"
  end

  private

  def invite_user_params
    params.require(:user).permit(:email, profile_attributes: [:first_name, :last_name])
  end
end
