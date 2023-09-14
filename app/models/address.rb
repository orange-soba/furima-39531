class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :order

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, :house_number, :phone_number
  end
end
