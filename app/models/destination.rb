class Destination < ApplicationRecord
  belongs_to :item_purchase

  # with_options presence: true do
  #     validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #     validates :city
  #     validates :address,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  #     validates :building_name
  #     validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # end

  # VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  # validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  
end
