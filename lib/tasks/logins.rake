namespace :logins do
  desc "seed admin"
  task seed_admin: :environment do
    User.destroy_all
    Friendship.destroy_all

    email = "arjuna@test.com"
    first_name = "Arjuna"
    last_name = "Lynham"
    password = "password"

    user = User.create!(
                  email: email,
                  first_name: first_name,
                  last_name: last_name,
                  password: password,
                  password_confirmation: password
                )

    5.times do |i|
      new_user = User.create(email: "test_#{i}@test.com", first_name: "#{Faker::Lorem.word}", last_name: "#{Faker::Lorem.word}", password: "password", password_confirmation: "password")
    end

    friend_1 = Friendship.create(user_id: 1, friend_id: 2)
    friend_2 = Friendship.create(user_id: 1, friend_id: 3)

  end

  desc "seed users"
  task seed_users: :environment do
    # create categories
    category_1 = Category.create(name: "Sports")
    category_2 = Category.create(name: "Fitness")
    category_4 = Category.create(name: "Health")


    5.times do |i|
      password = "password"
      user = User.create!(
                    username: "user_#{i}",
                    email: "email_#{i}@test.com",
                    password: password,
                    password_confirmation: password,
                    admin: false
                  )

      2.times do |i|
        article = Article.create(title: "#{Faker::Lorem.word}_#{i}", description: "#{Faker::Lorem.paragraph}_#{i}", user_id: user.id)
        ArticleCategory.create(article_id: article.id, category_id: category_1.id)
        ArticleCategory.create(article_id: article.id, category_id: category_2.id)
        ArticleCategory.create(article_id: article.id, category_id: category_4.id)
      end
    end
  end
end
