class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number, :phone_number
    validates :post_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
