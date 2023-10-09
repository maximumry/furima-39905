class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @log_delivery = LogDelivery.new
  end
end
