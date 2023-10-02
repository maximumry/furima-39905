class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index] 
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :burden_info_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
