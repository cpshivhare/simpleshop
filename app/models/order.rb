class Order < ApplicationRecord
  enum payment_status: %i[unpaid paid]
  enum status: %i[inprogress pending ordered completed canceled]

  belongs_to :user
  belongs_to :shipping_address, optional: true
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_one :payment

  accepts_nested_attributes_for :shipping_address

  # don't care until payment is inprogress mode.
  validates :shipping_address, presence: true, unless: :inprogress?

  # make order inprogress to ordered
  before_update :make_ordered!, if: :inprogress_to_ordered?

  def calculate_sub_total
    order_products.reduce(0) do |sum, order_item|
      sum += order_item.sub_total
      sum
    end
  end

  # We calculate here shiipping cost and othere
  def calculate_total
    order_products.reduce(0) do |sum, order_item|
      sum += order_item.total
      sum
    end
  end

  def update_order_prices
    update(sub_total: calculate_sub_total, total: calculate_total)
  end

  # make inprogress to ordered
  def make_ordered!
    create_payment!(status: :ordered)
    update(payment_status: :paid, status: :ordered, paid_at: Time.now)
  end

  private

  def inprogress_to_ordered?
    status_was == 'inprogress' && ordered?
  end
end
