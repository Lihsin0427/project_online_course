class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories= Category.order(id: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "類型新增成功!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "類型更新成功!"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path, notice: "類型已刪除!"
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
  
end
