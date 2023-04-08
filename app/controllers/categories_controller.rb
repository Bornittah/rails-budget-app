class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_details = @category.category_details.order(created_at: :desc)
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html { render :new, locals: { category: @category } }
    end
  end

  def create
    @category = Category.new(strong_params.merge(user_id: current_user.id))
    respond_to do |format|
      format.html do
        if @category.save!
          flash[:success] = 'category saved successfully'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: category could not be saved'
          render :new, locals: { category: @category }
        end
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'category deleted successfully'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: category could not be delete'
    end
  end

  private

  def strong_params
    params.require(:category).permit(:name, :icon)
  end
end
