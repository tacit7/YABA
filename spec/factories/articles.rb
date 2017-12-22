FactoryBot.define do
  factory :article do
    title { "Article Title" }
    description { "This is a sample description for the article." }
    association :user

    trait :with_categories do
      after(:create) do |article|
        create_list(:category, 3, articles: [article])
      end
    end
  end
end
