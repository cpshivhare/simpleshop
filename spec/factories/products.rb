FactoryBot.define do
  factory :product do
    sequence :title do |n|
      "product #{n}"
    end

    description { Faker::Lorem.sentence }
    image_url { Faker::LoremFlickr.image }
    price { 200 }
    sequence :sku do |n|
      "sku-#{n}"
    end

    stock { 3 }
    region
  end
end
