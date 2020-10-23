class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = OrderDonation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDonation.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else 
      render 'index'
    end
  end

  private

    def order_params
      params.require(:order_donation).permit(:item_id, :post_id, :prefecture_id, :city, :address, :buildingname, :tel).merge(user_id: current_user.id)
      # ストロングパラメーターの記述を訂正しましょう！受け取りたいキーを指定しましょう
    end
end