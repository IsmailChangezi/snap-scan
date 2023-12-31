class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.includes(:payments).where(user_id: current_user.id).order(updated_at: :desc)
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params[:category].merge!(user_id: current_user.id.to_s)
    params.require(:category).permit(:icon, :name, :user_id)
  end
end
