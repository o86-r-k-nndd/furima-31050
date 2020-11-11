class OrdersController < ApplicationController

  # 購入ページ表示
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  # 購入処理
  def create
    binding.pry
    # @order_address = OrderAddress.new(order_params)
    # if @order_address.valid?
    #   @order_address.save
    #   redirect_to root_path
    # else
       #render action: :index
    # end
  end

  private

  #paramsに送られてきた入力フォームの情報を取得するストロングパラメーター
  # def order_params
  #   params.require(:order_address ).permit( :postal_code,
  #                                           :municipalities,
  #                                           :address,
  #                                           :building_name,
  #                                           :phone_number,
  #                                           :delivery_area_id
  #                                 ).merge(  item_id: params[:item.id] )
  # end

end