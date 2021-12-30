class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :paid_at, :payment_status, :receiver_name, :sub_total, :shipping_address, :user_id

  belongs_to :user
  belongs_to :shipping_address
  has_many :order_products
  has_one :payment
end
