class OrdersController < ApplicationController

  def index
  end

  def create
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :city, :address, :building_name, :phone_number, :prefecture_id, :item_purchase_id).merge(user_id: current_user.id)
  end
end


