class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :user_id, :item_id, :city, :house_number, :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Only 10 to 11 digits in half-width numbers." }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, 
                  building: building, phone_number: phone_number, order_id: order.id)
  end
end
