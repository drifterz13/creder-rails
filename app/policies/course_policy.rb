# frozen_string_literal: true

class CoursePolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def index?
    user.permissions.include?(:view_course)
  end

  def show?
    user.permissions.include?(:view_course)
  end

  def create?
    user.permissions.include?(:create_course)
  end

  def new?
    user.permissions.include?(:create_course)
  end

  def update?
    user.permissions.include?(:edit_course)
  end

  def edit?
    user.permissions.include?(:edit_course)
  end

  def destroy?
    user.permissions.include?(:delete_course)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.permissions.include?(:view_course)
        scope.all
      end
    end

    private

    attr_reader :user, :scope
  end
end
