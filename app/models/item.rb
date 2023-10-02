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
  has_many :favorites, dependent: :destroy
  has_one :room

  with_options presence: true do
    validates :image, :name, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_day_id
  end
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "category_id", "condition_id", "fee_id", "price"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def favorited_num
    favorites.length
  end
end
