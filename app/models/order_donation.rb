class OrderDonation
  include ActiveModel::Model

  attr_accessor :post_id, :prefecture_id, :city, :address, :buildingname, :tel, :orders_id, :user_id, :item_id

  with_options presence: true do

    validates :post_id, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :buildingname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :tel
    validates :orders_id
  end

  def save
   address = Address.create(post_id: post_id, prefecture_id: prefecture_id, city: city, address: address, buildingname: buildingname, tel: tel, orders_id: orders_id )

   Order.create(user_id: user.id, item_id: item_id)
  end
end
