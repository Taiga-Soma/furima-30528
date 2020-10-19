class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    def create
      @item = Item.new(article_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  private

  def item_params
    params.require(:item, :article).permit(:content, :image, :title,:text,:genre_id,:status_id,:burden_id).merge(user_id: current_user.id)
  end
end
