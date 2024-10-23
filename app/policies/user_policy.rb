
# frozen_string_literal: true

class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.permissions.include?(:view_user)
  end

  def show?
    user.permissions.include?(:view_user) or user == record
  end

  def create?
    user.permissions.include?(:create_user)
  end

  def new?
    user.permissions.include?(:create_user)
  end

  def update?
    user.permissions.include?(:edit_user) or user == record
  end

  def edit?
    user.permissions.include?(:edit_user) or user == record
  end

  def destroy?
    user.permissions.include?(:delete_user)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.permissions.include?(:view_user)
        scope.all
      else
        scope.where(id: user.id)
      end
    end

    private

    attr_reader :user, :scope
  end
end
