class WelcomeController < ApplicationController
  def index
    @yfs = get_yf
  end

  def get_yf
    require 'uri'
    require 'net/http'
    
    url = URI("https://yahoo-finance15.p.rapidapi.com/api/v1/markets/stock/history?symbol=AAPL&interval=5m&diffandsplits=false")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = 'e7f6e7637fmshab60958cd514432p13a37fjsn26bb0feacaee'
    request["x-rapidapi-host"] = 'yahoo-finance15.p.rapidapi.com'
    
    response = http.request(request)
    puts response.read_body
    JSON.parse(response.read_body)
  end

end
