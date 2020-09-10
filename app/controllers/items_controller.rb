class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    # 保存できたらルートに飛ぶ、できなかったらnewにもどる
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :condition_id, :prefecture_id, :shipping_day_id, :shipping_fee_id).merge(user_id: current_user.id)
  end
end
