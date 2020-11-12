class OrdersController < ApplicationController

  # ログインしていない場合はログイン画面へ遷移する処理を行う
  before_action :authenticate_user!

  # 出品した商品の購入ページへ出品者が遷移しようとした時トップページへ遷移する処理
  before_action :user_seller?

  # 購入済みの商品の購入ページへ遷移しようとした時の処理
  before_action :sold_out?

  # 購入ページ表示
  def index
    set_new_form
  end

  # 購入処理
  def create
    binding.pry
    @order_address = OrderAddress.new(order_params)

    if form_valid?
      @order_address.save
      redirect_to root_path

    else
      set_new_form
      form_valid?
      render action: :index
      
    end
  end

  private

  #paramsに送られてきた入力フォームの情報を取得するストロングパラメーター
  def order_params
    params.require(:order_address ).permit( :postal_code,
                                            :municipalities,
                                            :address,
                                            :building_name,
                                            :phone_number,
                                            :delivery_area_id
                                  ).merge(  item_id:  params[:item_id],
                                            token:    params[:token] )
  end

  # indexアクションを行う時に呼び出すインスタンスを取得するメソッド
  def set_new_form
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  # OrderAddressモデルのバリデーションが正常に動作しているか確認する
  def form_valid?
    @order_address.valid?
  end

  # 自分が出品した商品の遷移しようした時トップページへ遷移する処理
  def user_seller?
    @item_user = Item.find(params[:item_id])
    if current_user.id == @item_user.user_id
      redirect_to root_path
    end
  end

  # 購入済みの商品ページへ遷移しようとした時にトップページへ遷移する処理
  def sold_out?
    @item_sold = Item.find(params[:item_id])
    unless @item_sold.order.nil?
      redirect_to root_path
    end
  end

end