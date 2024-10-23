class Admin::UsersController < ApplicationController
  include Pagy::Backend

  def index
    if params[:search].present?
      @pagy, @users = pagy(policy_scope(User).includes(:role).search(params[:search]))
    else
      @pagy, @users = pagy(policy_scope(User).includes(:role))
    end
  end
end
