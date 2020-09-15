class ItemPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :destination

  validates : user_id, presence: true
  validates : item_id, presence: true
end