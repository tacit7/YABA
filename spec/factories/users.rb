FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    password { SecureRandom.hex }
    username { 'username' }
    admin    { false }
  end

  trait :admin do
    admin { true }
  end
end
