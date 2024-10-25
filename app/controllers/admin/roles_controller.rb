class Admin::RolesController < ApplicationController
  include Pagy::Backend

  def index
    if params[:search].present?
      @pagy, @roles = pagy(Role.search(params[:search]))
    else
      @pagy, @roles = pagy(Role.all)
    end
  end

  def new
    @role = Role.new
    Permission.all.each do |permission|
      @role.role_permissions.build(permission: permission)
    end
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      respond_to do |format|
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Role was successfully created.' }
      end
    else
      render :new, alert: 'Failed to create role.'
    end
  end

  private

  def role_params
    params.require(:role).permit(
      :name,
      :description,
      role_permissions_attributes: [:id, :permission_id, :_destroy]
    )
  end

end
