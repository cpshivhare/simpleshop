require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  subject { build(:order_product, quantity: 2) }

  describe 'associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end

  describe 'validations' do
    it 'when order quantity is grater than product stock' do
      order_product = build(:order_product, quantity: 5, product: build(:product, stock: 2))

      expect(order_product).not_to be_valid
      expect(order_product.errors.full_messages).to include(/Sorry! Stock is not availble at this time. max order value is for this product 2/)
    end
  end
end
