class OrdersController < ApplicationController

  # 指定したアクションに対して ログインしていない場合はログイン画面へ遷移する処理を行う
  before_action :authenticate_user!, only: [:index, :create]

  # 購入ページ表示
  def index
    set_action_index
  end

  # 購入処理
  def create
    @order_address = OrderAddress.new(order_params)
    if order_valid?
      @order_address.save
      redirect_to root_path
    else
      set_action_index
      order_valid?
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
                                  ).merge(  item_id: params[:item_id] )
  end

  # indexアクションを行う時に呼び出すインスタンスを取得するメソッド
  def set_action_index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  # OrderAddressモデルのバリデーションが正常に動作しているか確認する
  def order_valid?
    @order_address.valid?
  end

end