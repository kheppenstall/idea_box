class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category #{@category.name} created!"
      redirect_to categories_path
    else
      flash[:danger] = @category.errors.full_messages.first
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:warning] = "#{@category.name} deleted."
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end