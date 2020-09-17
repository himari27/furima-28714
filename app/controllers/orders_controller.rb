class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :move_to_index_2, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_purchase_params)
      # binding.pry
    if @order_purchase.valid?
      pay_item
      # binding.pry
      @order_purchase.save
      redirect_to root_path
    else
      # binding.pry
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_purchase_params
    @item = Item.find(params[:item_id])
    params.require(:order_purchase).permit(:token, :post_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id).merge(price:@item.price).merge(item_id:params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_9009f488776dc6c57b6fe3cb"
    Payjp::Charge.create(
      amount: order_purchase_params[:price],
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && ItemPurchase.exists?(item_id:@item.id)
      redirect_to root_path
    end
  end

  def move_to_index_2
    @item = Item.find(params[:item_id])
    if user_signed_in? && (current_user.id == @item.user_id)
      redirect_to root_path
    end
  end

end


   # elsif
    #   user_signed_in? &&  (@item.item_purchase.item_id == @item.id)
    #   redirect_to root_path

