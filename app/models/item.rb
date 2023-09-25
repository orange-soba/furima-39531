class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id
  end
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  def sold
    if Order.find_by(item_id: self.id)
      return true
    else
      return false
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
