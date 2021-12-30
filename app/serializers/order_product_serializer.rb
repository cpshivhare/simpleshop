class OrderProductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :sub_total, :total, :product

  belongs_to :order
  belongs_to :product
end
