class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price, :tpken, :post_code, :city, :address, :building_name, :phone_number, :prefecture_id, :item_purchase_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_9009f488776dc6c57b6fe3cb"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end


