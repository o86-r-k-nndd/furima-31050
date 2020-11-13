class Address < ApplicationRecord

  #Association ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area

  #Assciation
  belongs_to :order
  
end
