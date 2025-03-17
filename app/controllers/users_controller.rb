class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    # debugger
    @friends = current_user.friends

    @friend = nil
    if params[:friend].present?
      @friend = User.find_by email: params[:friend]
      if @friend
        render "users/my_friends"
      else
        flash[:alert] = "user not Found"
        redirect_to my_friends_path
      end
    else
      flash[:alert] = "Please enter a user to search"
      redirect_to my_friends_path
    end

    # render json: { ticker: @stock.ticker, name: @stock.name, last_price: @stock.last_price }
  end
end

