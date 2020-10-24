class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order = OrderDonation.new
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDonation.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],        # 商品の値段
        card: order_params[:token],   # カードトークン
        currency: 'jpy'               # 通過の種類（日本円）
      )
      @order.save
      redirect_to root_path

    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_donation).permit(:post_id, :prefecture_id, :city, :address, :buildingname, :tel, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
