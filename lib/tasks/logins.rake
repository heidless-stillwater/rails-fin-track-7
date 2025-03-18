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
end
