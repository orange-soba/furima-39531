class Message < ApplicationRecord
  belongs_to :room

  validates :message, presence: true
end
