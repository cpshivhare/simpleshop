FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    username { Faker::Name.unique.name }

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
