class Item < ApplicationRecord

  #Assciation ActiveStorege
  has_one_attached :image

  #Assciation ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

end
