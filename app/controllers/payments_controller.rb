class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.where(author: current_user, category_id: @category.id).order(updated_at: :desc)
    @total = Payment.where(author: current_user, category_id: @category.id).sum(:amount)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.author_id = current_user.id
    category = Category.find(params[:category_id])
    @payment.category_id = category.id
    if @payment.save
      redirect_to category_payments_path
    else
      render 'new'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
