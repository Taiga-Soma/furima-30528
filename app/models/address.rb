class Address < ApplicationRecord
  belongs_to :order, optional: true #belongs_toの外部キーのnilを許可する
  belongs_to :user, optional: true #belongs_toの外部キーのnilを許可する
  with_options presence: true do
    validates :post_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
  end
end
