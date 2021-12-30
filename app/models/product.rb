class Product < ApplicationRecord
  belongs_to :region
  has_many :order_products
  has_many :orders, through: :order_products

  validates :title, presence: true, uniqueness: true
  validates :sku, presence: true, uniqueness: true
  validates :price, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }

  def reduce_stock(stock_count)
    update(stock: stock - stock_count)
  end
end
