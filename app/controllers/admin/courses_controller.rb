class Admin::CoursesController < ApplicationController
  include Pagy::Backend

  def index
    authorize Course, :index?

    if params[:search].present?
      @pagy, @courses = pagy(policy_scope(Course).search(params[:search]))
    else
      @pagy, @courses = pagy(policy_scope(Course))
    end
  end

  def show
  end
end
