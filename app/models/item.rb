class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user

  validates :name, :explanation, presence: true
  validates :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id, presence: true, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
end
