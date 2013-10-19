class MerchantsController < ApplicationController

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      flash[:notice] = "Merchant added"
    else
      flash[:error] = @merchant.errors.full_messages
    end
    redirect_to expenses_url
  end

  def destroy
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end
