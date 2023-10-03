class Room < ApplicationRecord
  belongs_to :item
  has_many :messages

  validates :limit, presence: true
  validate :restrict_limit

  def restrict_limit
    if limit.present? && limit.to_i > (created_at + 3.week).end_of_day.to_i
      errors.add(:limit, "はコミュニケーションページの作成された日の3週間後を超えてはいけません")
    end
  end
end
