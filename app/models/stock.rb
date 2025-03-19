class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.yh_finance_stock_price(t_symbol)
    require "uri"
    require "net/http"

    url = URI("https://yahoo-finance15.p.rapidapi.com/api/v1/markets/stock/history?symbol=#{t_symbol}&interval=5m&diffandsplits=false")
    # debugger
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    #    request["x-rapidapi-key"] = 'e7f6e7637fmshab60958cd514432p13a37fjsn26bb0feacaee'
    request["x-rapidapi-key"] = Rails.application.credentials.dig(:yahoo_finance_api, :api_key)

    request["x-rapidapi-host"] = "yahoo-finance15.p.rapidapi.com"

    response = http.request(request)

    # Status
    # puts response.code       # => '200'
    # puts response.message    # => 'OK'
    # puts response.class.name # => 'HTTPOK'

    # debugger

    # puts "RESPONSE STATUS: #{response.code}"
    if response.code == "200"
      tmp = JSON.parse(response.read_body)
      if tmp["success"] == false
        nil
      else
        regularMarketPrice = tmp["meta"]["regularMarketPrice"]
        shortName = tmp["meta"]["shortName"]
        longName = tmp["meta"]["longName"]
        new(ticker: t_symbol, name: shortName, last_price: regularMarketPrice)
      end
    end
  end

  def self.finnhub_stock_price(t_symbol)
    require 'finnhub_ruby'

    FinnhubRuby.configure do |config|
      # Rails.application.credentials.dig(:finnhub_api, :api_key)
      config.api_key['api_key'] = 'cvamkq1r01qsapma7mj0cvamkq1r01qsapma7mjg'
    end

    finnhub_client = FinnhubRuby::DefaultApi.new
    puts("===================================================")
    puts(finnhub_client.company_profile2({symbol: 'TEST'}))
    company_profile = finnhub_client.company_profile2({symbol: t_symbol})

    finnhub_client = FinnhubRuby::DefaultApi.new
    company_quote = finnhub_client.quote(t_symbol)
    puts(company_quote)
    puts("===================================================")


    new(ticker: t_symbol, name: company_profile.name, last_price: company_quote.c)
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

end
