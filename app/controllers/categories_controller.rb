class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category added"
    else
      flash[:error] = @category.errors.full_messages
    end
    redirect_to expenses_url
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
