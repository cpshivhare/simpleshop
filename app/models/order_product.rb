class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :cal_and_update_price
  after_save :reduce_product_stock
  after_save :update_order_prices

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :exceed_quantity

  def add_quantity!(qty)
    update!(quantity: quantity + qty.to_i) if qty
  end

  def cal_and_update_price
    self.sub_total = calculate_sub_total
    self.total = calculate_total
  end

  def calculate_total
    sub_total + calculate_tax
  end

  def update_order_prices
    order.update_order_prices
  end

  def calculate_sub_total
    (product.price * quantity)
  end

  def calculate_tax
    (product.price * (product.region.tax / 100)) * quantity
  end

  private

  def reduce_product_stock
    product.reduce_stock(quantity)
  end

  def exceed_quantity
    return if product&.stock.to_i >= quantity

    errors.add :quantity,
               "Sorry! Stock is not availble at this time. max order value is for this product #{product&.stock}"
  end
end
