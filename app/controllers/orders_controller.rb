class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item
  before_action :currentuser_item, expect: :index
  before_action :find_gon, only: :index
  
  def index
    @log_delivery = LogDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @log_delivery = LogDelivery.new(delivery_params)
    if @log_delivery.save
      pay_item
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      find_gon
    end
  end
  

  private
    def delivery_params
      params.require(:log_delivery).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: delivery_params[:price],
        card: delivery_params[:token],
        currency: 'jpy'
      ) 
    end

    def sold_out_item
      @item = Item.find(params[:item_id])
      if @item.log.present?
        redirect_to root_path
      end
    end

    def currentuser_item
      @item = Item.find(params[:item_id])
      if @item.user == current_user
        redirect_to root_path
      end
    end

    def find_gon
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])
    end
end
