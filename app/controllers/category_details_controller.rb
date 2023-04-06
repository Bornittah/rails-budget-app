class CategoryDetailsController < ApplicationController
  before_action :authenticate_user!
  def new
    @category = Category.find(params[:category_id])
    @category_detail = CategoryDetail.new
    respond_to do |format|
      format.html { render :new, locals: { category: @category, category_detail: @category_detail } }
    end
  end

  def create
    @category_detail = CategoryDetail.new(strong_params.merge(author_id: current_user.id,
                                                              category_id: params[:category_id]))
    # @category_detail.category = @category
    respond_to do |format|
      format.html do
        if @category_detail.save!
          flash[:success] = 'transition saved successfully'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: transition could not be saved'
          render :new, locals: { category: @category, category_detail: @category_detail }
        end
      end
    end
  end

  private

  def strong_params
    params.require(:transition).permit(:name, :amount, :categories_id)
  end
end
