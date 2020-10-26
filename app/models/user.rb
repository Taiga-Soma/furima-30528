class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :orders
  has_many :address
  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
    /\A[a-z0-9]+\z/
    
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
   
  end
end
