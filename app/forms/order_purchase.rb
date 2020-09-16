class OrderPurchase

  include ActiveModel::Model
  attr_accessor :price, :token,:user_id, :item_id, :post_code, :city, :address, :building_name, :phone_number, :prefecture_id

  with_options presence: true do
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    # binding.pry
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city:city, address:address, building_name:building_name, phone_number:phone_number,item_purchase_id:item_purchase.id)
  end


end