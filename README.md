
## my_portfolio
- views/my_portfolio.html.erb
  - Search Stocks
    - <%= form_tag search_stock_path, method: :get, local: true, data: { turbo: false } do  %>
    
      - controllers/stocks_controller.rb
        - StocksController.search

## my_friends
- views/my_friends.html.erb
  - Search Friends
  