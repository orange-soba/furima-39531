class Room < ApplicationRecord
  belongs_to :item

  validates :limit, presence: true
end
