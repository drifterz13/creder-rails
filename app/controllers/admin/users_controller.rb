class Admin::UsersController < ApplicationController
  include Pagy::Backend

  def index
    if params[:search].present?
      @pagy, @users = pagy(policy_scope(User).includes(:role).search(params[:search]))
    else
      @pagy, @users = pagy(policy_scope(User).includes(:role))
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "User has been deleted successfully" }
      format.turbo_stream { flash.now[:notice] = "User has been deleted successfully" }
    end
  end
end
