class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :item_purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_fee
  has_one_attached :image

  validates :image, presence: true
  validates :name, :text, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'must be more than 300' }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'must be lower than 9,999,999' }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :shipping_fee_id
  end
end
