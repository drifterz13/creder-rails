class Admin::UsersController < ApplicationController
  include Pagy::Backend

  def index
    if params[:search].present?
      @pagy, @users = pagy(User.search(params[:search]))
    else
      @pagy, @users = pagy(User.all)
    end
  end
end
