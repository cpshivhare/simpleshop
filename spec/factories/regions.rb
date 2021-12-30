FactoryBot.define do
  factory :region do
    sequence :title do |n|
      "region #{n}"
    end
    country { 'United States of America' }
    currency { "$" }
    tax { 10 }
  end
end
