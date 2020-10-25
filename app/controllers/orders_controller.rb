class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]
  before_action :set_present, only: [:index]
  before_action :set_pay, only: [:create]

  def index
    @order = OrderDonation.new
  end

  def create
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
    params.require(:order_donation).permit(:post_id, :prefecture_id, :city, :address, :buildingname, :tel, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_present 
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],        # 商品の値段
      card: order_params[:token],   # カードトークン
      currency: 'jpy'               # 通過の種類（日本円）
    )
  end

end
