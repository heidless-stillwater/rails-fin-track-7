class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    puts "############################## #{current_user.email}"
    @friends = current_user.friends
    # debugger
    if @friends.empty? 
      puts "############################## You have no friends"
    else
      puts "############################## Friends found [#{@friends.count}]"      
    end
  end
  
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    # debugger
    @user = current_user

    @friends = current_user.friends

    @friends_srch = nil
    if params[:friend].present?
      @friends_srch = User.search(params[:friend])
      # debugger

      
      if !@friends_srch.empty?
        # debugger
        render "users/my_friends"
      else
        flash[:alert] = "No User Found"
        redirect_to my_friends_path
      end
    else
      flash[:alert] = "Please enter a user to search"
      redirect_to my_friends_path
    end

    # render json: { ticker: @stock.ticker, name: @stock.name, last_price: @stock.last_price }
  end
end

