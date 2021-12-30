class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :price, :sku, :stock

  belongs_to :region
  has_many :order_products
end
