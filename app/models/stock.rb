class Stock < ApplicationRecord

  def self.new_lookup(t_symbol)
    require 'uri'
    require 'net/http'
    
    url = URI("https://yahoo-finance15.p.rapidapi.com/api/v1/markets/stock/history?symbol=#{t_symbol}&interval=5m&diffandsplits=false")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = 'e7f6e7637fmshab60958cd514432p13a37fjsn26bb0feacaee'
    request["x-rapidapi-host"] = 'yahoo-finance15.p.rapidapi.com'
    
    response = http.request(request)
    tmp = JSON.parse(response.read_body)
    regularMarketPrice = tmp["meta"]["regularMarketPrice"]

  end


end
