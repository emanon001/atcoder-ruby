n, w = gets.not_nil!.split.map(&.to_i)
wv_list = n.times.map { gets.not_nil!.split.map(&.to_i) }.to_a
dp = Array(Array(Int64)).new
max_v = 10 ** 3 * n
INF = Int64::MAX
(n + 10).times do |i|
  dp.push(Array.new(max_v + 10, INF))
end
dp[0][0] = 0_i64
(0...n).each do |i|
  iw, iv = wv_list[i]
  (0..max_v).each do |j|
    dp[i + 1][j] =
      if j < iv
        dp[i][j]
      elsif dp[i][j - iv] != INF
        v1 = dp[i][j]
        v2 = dp[i][j - iv] + iw
        v1 > v2 ? v2 : v1
      else
        dp[i][j]
      end
  end
end
max_v.downto(0) do |v|
  nw = dp[n][v]
  if nw <= w
    puts v
    exit 0
  end
end
