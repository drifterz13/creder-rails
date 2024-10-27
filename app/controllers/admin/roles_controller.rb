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

  def edit
    @role = Role.find(params[:id])
    current_permission_ids = @role.permissions.map { |permission| permission.id }

    Permission.all.each do |permission|
      @role.role_permissions.build(permission: permission) unless current_permission_ids.include?(permission.id)
    end
  end

  def update
    @role = Role.find(params[:id])

    if @role.update(role_params)
      respond_to do |format|
        format.html { redirect_to admin_roles_path, notice: 'Role was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Role was successfully updated.' }
      end
    else
      render :new, alert: 'Failed to updated role.'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to admin_roles_path, notice: "Role has been deleted successfully" }
      format.turbo_stream { flash.now[:notice] = "Role has been deleted successfully" }
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
