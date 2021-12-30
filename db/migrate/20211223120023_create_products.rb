class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.decimal :price, precision: 10, scale: 2
      t.string :sku
      t.integer :stock
      t.references :region

      t.timestamps
    end
  end
end
