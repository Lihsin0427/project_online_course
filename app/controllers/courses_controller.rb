class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy, :show]

  def index
    @courses = Course.includes(:category).order(updated_at: :desc)
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, notice: "課程新增成功!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功!"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    redirect_to courses_path, notice: "課程已刪除!"
  end

  private
  def set_course
    @course = Course.includes(:category).find_by!(url: params[:url])
  end

  def course_params
    params.require(:course).permit(:topic, :price, :currency, :is_available, :url, :content, :validity_period, :category_id)
  end
end
