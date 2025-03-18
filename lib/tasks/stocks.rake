namespace :stocks do
  desc "seed stocks"
  task seed_stocks: :environment do
    Stock.destroy_all
    UserStock.destroy_all

    5.times do |i|
      stock = Stock.create(ticker: "TICKER_#{i}", name: "#{Faker::Lorem.word}_#{i}", last_price: rand(100.0..900.0).round(2))
      user_stock = UserStock.create(user_id: 1, stock_id: stock.id)
      puts "Stock: #{stock.ticker} - #{stock.name} - #{stock.last_price}"
      puts "UserStock: #{user_stock.user_id} - #{user_stock.stock_id}"
    end

  end

end
