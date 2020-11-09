class OrderDonation
  include ActiveModel::Model

   attr_accessor :post_id, :prefecture_id, :city, :address, :buildingname, :tel, :orders_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_id, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
  end
  
  # ウィザード形式で事前にユーザー情報を登録しているため

  # def save
  #   order = Order.create(user_id: user_id, item_id: item_id)
  #   Address.create!(post_id: post_id, prefecture_id: prefecture_id, city: city, address: address, buildingname: buildingname, tel: tel, order_id: order.id, user_id: user_id)
  # end
end
