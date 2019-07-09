n, w = gets.not_nil!.split.map(&.to_i)
wv_list = n.times.map { gets.not_nil!.split.map(&.to_i) }.to_a
dp = Array(Array(Int64)).new
(n + 10).times do |i|
  dp.push(Array.new(w + 10, Int64.new(0)))
end
(0...n).each do |i|
  iw, iv = wv_list[i]
  (0..w).each do |j|
    dp[i + 1][j] =
      if j < iw
        dp[i][j]
      else
        v1 = dp[i][j]
        v2 = dp[i][j - iw] + iv
        v2 > v1 ? v2 : v1
      end
  end
end
puts dp[n][w]
