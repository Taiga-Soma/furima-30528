class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :orders
  has_many :address
  has_many :items

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
