require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:region) }
    it { is_expected.to have_many(:order_products) }
    it { is_expected.to have_many(:orders).through(:order_products) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:sku) }
    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_uniqueness_of(:sku) }

    it do
      is_expected.to validate_numericality_of(:stock)
        .is_greater_than_or_equal_to(0)
    end
  end
end
