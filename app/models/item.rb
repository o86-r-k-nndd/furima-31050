class Item < ApplicationRecord

  #Assciation ActiveStorege
  has_one_attached :image

  #Assciation ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :delivery_area
  belongs_to :delivery_day
  
end
