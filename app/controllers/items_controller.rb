class ItemsController < ApplicationController

  #ログインしていない場合出品画面には遷移せず、ログイン画面に遷移する
  before_action :authenticate_user!, only: [:new]

  #top page
  def index
    @items = Item.all.order(id: :DESC)
  end

  #商品出品ページ
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.valid?
      render :new
    end
  end

  private

  #ストロングパラメーターの設定
  def item_params
    params.require(:item).permit( :explanation,
                                  :name,
                                  :category_id,
                                  :status_id,
                                  :shipping_id,
                                  :delivery_area_id,
                                  :delivery_days_id,
                                  :price,
                                  :image
                                ).merge(
                                  user_id: current_user.id
                                )
  end
end
