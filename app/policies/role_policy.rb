# frozen_string_literal: true

class RolePolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  def index?
    user.permissions.include?(:view_role)
  end

  def show?
    user.permissions.include?(:view_role) or user.role == role
  end

  def create?
    user.permissions.include?(:create_role)
  end

  def new?
    user.permissions.include?(:create_role)
  end

  def update?
    user.permissions.include?(:edit_role)
  end

  def edit?
    user.permissions.include?(:edit_role)
  end

  def destroy?
    user.permissions.include?(:delete_role)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.permissions.include?(:view_role)
        scope.all
      else
        scope.where(id: user.role.id)
      end
    end

    private

    attr_reader :user, :scope
  end
end
