FactoryBot.define do
  factory :order do
    total { nil }
    paid_at { Time.now - 2.days }
    payment_status { 'unpaid' }
    receiver_name { Faker::Name.name }
    shipping_address
    user
  end
end
