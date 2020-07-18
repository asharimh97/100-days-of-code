# def stock_picker(prices)
#   profit_map = []
#   prices.each_with_index do |pr, i|
#     price = {
#       "buy" => pr,
#       "day_buy" => i,
#       "sell" => pr,
#       "day_sell" => i
#     }

#     range = (i+1..prices.length - 1)
#     for j in range do
#       if (prices[j] > price["sell"]) 
#         price["sell"] = prices[j]
#         price["day_sell"] = j
#       end
#     end
#     profit_map[i] = price
#   end

#   max_profit = profit_map.max_by { |x| x["sell"] - x["buy"] }

#   return [max_profit["day_buy"], max_profit["day_sell"]]
# end

def stock_picker (prices)
  max_profit = [0, 0, 0]

  prices.each_with_index do |price, i|
    prices[i, prices.size - 1].each_with_index do |next_price, j|
      if next_price - price > max_profit[2]
        # p prices[i, prices.size - 1]
        # p [i, price, j, next_price]
        max_profit = [i, i + j, next_price - price]
      end
    end
  end

  max_profit[0..1]
end

days = [17,3,6,9,15,8,6,1,10,12]

p stock_picker(days)