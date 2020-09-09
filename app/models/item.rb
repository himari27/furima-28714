class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  has_one_attached :image
 
  validates :name, :text, :category, :condition, :prefecture, :shipping_day, :shipping_fee, presence: true
  # with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 
    validates :price, :numericality => { :greater_than_or_equal_to => 300 , message:'must be more than 300'}
    validates :price, :numericality => { :less_than_or_equal_to => 9999999 , message:'must be lower than 9,999,999'}

  # end
end
