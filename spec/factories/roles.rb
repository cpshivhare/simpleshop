FactoryBot.define do
  factory :role do
    name { 'customer' }
  end

  trait :admin do
    name { 'admin' }
  end
end
