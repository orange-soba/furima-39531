class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字（6文字以上）での入力が必須です' }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は、全角（カタカナ）での入力が必須です' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は、全角（カタカナ）での入力が必須です' }
  validates :birthday, presence: true

  has_many :items
  has_many :orders
  has_many :favorites
  has_many :messages

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end
end
