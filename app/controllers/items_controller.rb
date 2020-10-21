class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
   
  end

  def destroy
    @item.destroy if  current_user.id == @item.user_id
    redirect_to root_path
  end 


  private

  def item_params
    params.require(:item).permit(:title, :price, :description, :category_id, :status_id, :burden_id, :prefecture_id, :daystoship_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
