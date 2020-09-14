class Destination < ApplicationRecord
  belongs_to :item_purchase

  with_options presence: true,
  validates :post_code
  validates :city
  validates :address
  validates :building_name
  validates :phone_number
  validates :prefecture_id
  validates :item_purchase_id
end
