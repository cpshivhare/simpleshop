class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
