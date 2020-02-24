class MerchantsController < ApplicationController
  before_action :set_merchant, except: [:index]

  def index
    @merchants = current_user.merchants
  end

  def show; end

  def edit; end

  def update
    if @merchant.update(merchant_params)
      redirect_to merchant_path(@merchant)
    else
      render :edit
    end
  end

  def destroy
    if @merchant.destroy
      flash[:notice] = 'Merchant deleted successfully'
    else
      flash[:error] = @merchant.errors.full_messages.join(',')
    end
    redirect_to merchants_path
  end

  def transaction_history
    @transactions = @merchant.transactions
  end

  private

  def merchant_params
    params.require(:user).permit(:name, :email, :description, :status)
  end

  def set_merchant
    @merchant = current_user.merchants.find_by(id: params[:id])
  end
end
