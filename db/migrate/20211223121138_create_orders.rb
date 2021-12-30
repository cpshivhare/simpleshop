class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :shipping_address
      t.references :user
      t.decimal :total, precision: 6, scale: 2
      t.decimal :sub_total, precision: 6, scale: 2
      t.datetime :paid_at
      t.integer :payment_status, default: 0
      t.string :receiver_name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
