require 'faker'

# Clear existing data
ArticleCategory.destroy_all
Article.destroy_all
Category.destroy_all
User.destroy_all

users = []
puts 'Creating users.'
10.times do
  users << User.create!(
    username: Faker::Internet.unique.username(specifier: 5..10),
    email: Faker::Internet.unique.email,
    password: 'password',
    admin: [true, false].sample
  )
end

puts 'Creating categories.'
categories = []
5.times do
  categories << Category.create!(
    name: Faker::Book.genre
  )
end

# Create articles
puts 'Creating articles.'
50.times do
  article = Article.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    user: users.sample
  )

  # Associate categories with articles
  article_categories = categories.sample(rand(1..3))
  article_categories.each do |category|
    ArticleCategory.create!(
      article: article,
      category: category
    )
  end
end

puts "Admin: #{User.admin.first.email}"
puts "Regular User: #{User.not_admin.first.email}"
puts "Finished Seeding!"
