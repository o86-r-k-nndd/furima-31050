class ItemsController < ApplicationController
  def index
  end
  private

  #ストロングパラメーターの設定
  def item_params
    params.require(:item).permit( :explantion,
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
