class StocksController < ApplicationController

  def search
    # if params[:stock].present?
    
    @stock = Stock.stock_price(params[:stock])
    # puts @stock.ticker, @stock.name, @stock.last_price
    # debugger
    # render json: { ticker: @stock.ticker, name: @stock.name, last_price: @stock.last_price }
    render 'users/my_portfolio'
  end
end




