N = gets.to_i
ans = 0
rest = 1000 - N
coins = [500, 100, 50, 10, 5, 1]
coins.each do |coin|
  count = rest / coin
  rest -= (coin * count)
  ans += count
end
puts ans