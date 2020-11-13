class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code
      t.string      :municipalities
      t.string      :address
      t.string      :building_name
      t.string      :phone_number
      t.integer     :delivery_area_id
      t.references  :order
      t.timestamps
    end
  end
end
