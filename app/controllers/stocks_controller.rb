class StocksController < ApplicationController
  def search
    # debugger
    @tracked_stocks = current_user.stocks

    @stock = nil
    if params[:stock].present?
      @stock = Stock.finnhub_stock_price(params[:stock])
      if @stock
        render "users/my_portfolio"
      else
        flash[:alert] = "Symbol not Found"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end

    # render json: { ticker: @stock.ticker, name: @stock.name, last_price: @stock.last_price }
  end
end
