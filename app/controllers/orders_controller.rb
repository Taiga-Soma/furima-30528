class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]
  before_action :set_present, only: :index
  before_action :set_pay, only: :create
  before_action :find_item, only: :order
  before_action :set_card, only: :index
  before_action :set_address, only: :index


  def index
    redirect_to new_card_path and return unless current_user.card.present?
    
    @order = OrderDonation.new
    @cards = Card.all

  end

  def create
    @order = Order.create(order_params)
    if @order.valid?
      @order.save
      redirect_to item_orders_path

    # else ウィザード形式のため
    #   render 'index'
    end
  end

  # def order # 購入する時のアクションを定義
  #   redirect_to new_card_path and return unless current_user.card.present?

  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
  #   customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
  #   Payjp::Charge.create(
  #     amount: @item.price, # 商品の値段
  #     customer: customer_token, # 顧客のトークン
  #     currency: 'jpy' # 通貨の種類（日本円）
  #     )

  #   ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する
  
  #   redirect_to root_path
  # end

  private

  def order_params
    params.permit(:item_id).merge(user_id:current_user.id)
  # ウィザード形式を使用しているため
    # params.require(:order_donation).permit(:post_id, :prefecture_id, :city, :address, :buildingname, :tel, :token).merge(user_id: current_user.id, item_id: params[:item_id])
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
   customer_token = current_user.card.customer_token
   Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      customer: customer_token,   # カードトークン
      currency: 'jpy'               # 通過の種類（日本円）
      )
  end

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

end