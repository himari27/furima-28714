class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
 
  validates :name, :text, :price, :category, :condition, :prefecture, :shipping_day, :shipping_fee, presence: true

end
