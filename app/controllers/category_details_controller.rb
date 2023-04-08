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

    category_id = params[:category_id]
    @category_detail.category_id = category_id

    respond_to do |format|
      format.html do
        if @category_detail.save!
          flash[:success] = 'transition saved successfully'
          redirect_to category_url(category_id)
        else
          flash.now[:error] = 'Error: transition could not be saved'
          render :new, locals: { category: @category, category_detail: @category_detail }
        end
      end
    end
  end

  def destroy
    @category_detail = CategoryDetail.find(params[:id])
    @category_detail.destroy

    respond_to do |format|
      format.html { redirect_to category_url, notice: 'Transaction deleted successfully.' }
    end
  end

  private

  def strong_params
    params.require(:transition).permit(:name, :amount, :categories_id)
  end
end
