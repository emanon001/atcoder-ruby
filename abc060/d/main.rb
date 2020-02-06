N, W = gets.split.map(&:to_i)

WV = N.times.map { gets.split.map(&:to_i) }

dp = Hash.new { 0 }
dp[0] = 0
N.times do |i|
  w, v = WV[i]
  new_dp = dp.dup
  dp.each do |cw, cv|
    if cw + w <= W
      to_v = dp[cw + w]
      new_v = cv + v
      new_dp[cw + w] = new_v > to_v ? new_v : to_v
    end
  end
  dp = new_dp
end
ans = dp.values.max
puts ans