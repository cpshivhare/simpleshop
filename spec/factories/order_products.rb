FactoryBot.define do
  factory :order_product do
    quantity { 3 }
    sub_total { nil }
    total { nil }
    order
    product
  end
end
