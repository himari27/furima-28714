class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :move_to_index_2, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_purchase_params
    # binding.pry
    @item = Item.find(params[:item_id])
    params.require(:order_purchase).permit(:post_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id).merge(price: @item.price).merge(item_id: params[:item_id]).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_purchase_params[:price],
      card: order_purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && ItemPurchase.exists?(item_id: @item.id)
  end

  def move_to_index_2
    # @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && (current_user.id == @item.user_id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
