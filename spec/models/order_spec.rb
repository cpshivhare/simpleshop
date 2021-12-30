require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:shipping_address).optional }
    it { is_expected.to have_many(:order_products) }
    it { is_expected.to have_many(:products).through(:order_products) }
    it { is_expected.to have_one(:payment) }
  end
end
