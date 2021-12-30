class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :zipcode
      t.string :country
      t.string :state
      t.string :city
      t.string :telephone
      t.boolean :default, default: false
      t.references :user

      t.timestamps
    end
  end
end
