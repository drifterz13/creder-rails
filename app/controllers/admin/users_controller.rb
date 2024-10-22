class Admin::UsersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @users = pagy(User.all)
  end
end
