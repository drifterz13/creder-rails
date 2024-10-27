class CoursesController < ApplicationController
  # TODO: Implements basic authorization via token
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def course_params
    params.require(:course).permit(:code, :name, :description, :grading_type)
  end
end
