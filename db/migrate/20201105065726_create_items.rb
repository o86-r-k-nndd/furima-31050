class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :explanation
      t.string      :name
      t.integer     :category_id
      t.integer     :status_id
      t.integer     :shipping_id
      t.integer     :delivery_area_id
      t.integer     :delivery_days_id
      t.integer     :price
      t.references  :user
      t.timestamps
    end
  end
end
