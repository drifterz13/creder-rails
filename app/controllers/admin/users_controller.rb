class Admin::UsersController < ApplicationController
  def index
    @users = User.includes(:profile).all
  end
end
