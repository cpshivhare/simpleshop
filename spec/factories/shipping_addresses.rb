FactoryBot.define do
  factory :shipping_address do
    address_1 { Faker::Address.street_address }
    address_2 { Faker::Address.secondary_address  }
    zipcode { Faker::Address.zip_code }
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
    telephone { Faker::PhoneNumber.phone_number }
    user
  end
end
