class ItemsController < ApplicationController

  #特定のアクションにのみログインしていない場合はログイン画面に遷移する処理を行う
  before_action :authenticate_user!, only: [:new, :edit]

  #top page
  def index
    @items = Item.all.order(id: :DESC)
  end

  #商品出品ページ
  def new
    @item = Item.new
  end

  #データベースへ値を保存する
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.valid?
      render :new
    end
  end

  #商品詳細ページ
  def show
    set_item_find
  end

  #商品編集ページ
  def edit
    set_item_find

    #出品者とは違うユーザーが編集ページへ遷移しようとした時はトップページへ遷移する
    unless current_user.id == @item.user_id
      redirect_to root_path
    end

  end

  #データベースの情報を更新する
  def update
    set_item_find
    if @item.update(item_params)
      redirect_to action: :show
    else
      @item.valid?
      render :edit
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
                                  :delivery_day_id,
                                  :price,
                                  :image
                                ).merge(
                                  user_id: current_user.id
                                )
  end

  #Itemモデルの特定のテーブルの値を取得
  def set_item_find
    @item = Item.find(params[:id])
  end

end
