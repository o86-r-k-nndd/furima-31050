class Item < ApplicationRecord

  #Assciation ActiveStorege
  has_one_attached :image, presence: true

  #Assciation ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  #validation not null
  with_option presence: true do
    validates :explanation
    validates :name
  end

  #validation not null ジャンル選択時[---]の時は保存できない様にする
  with_option presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :delivery_area_id
    validates :delivery_days_id
  end

  #validation not null 半角数字のみ カラムの型はinteger型のみ 最小値(300)、最大値(9,999,999)の制約
  validates :price, presence:                                   true,
                    format:       { with:                       /\A[0-9]+\z/ },
                    nemericality: { only_integer:               true,
                                    greater_than_or_equal_to:   300,
                                    less_than_or_equal_to:      9999999}



end
