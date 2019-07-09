N, W = gets.split.map(&:to_i)
wv_list = N.times.map { gets.split.map(&:to_i) }
dp = Array.new(N + 10)
max_v = 10 ** 3 * N
INF = 2 << 60
(N + 10).times do |i|
  dp[i] = Array.new(max_v + 10, INF)
end
dp[0][0] = 0
(0...N).each do |i|
  iw, iv = wv_list[i]
  (0..max_v).each do |j|
    dp[i + 1][j] =
      if j < iv
        dp[i][j]
      elsif dp[i][j - iv] != INF
        [dp[i][j], dp[i][j - iv] + iw].min
      else
        dp[i][j]
      end
  end
end
ans = 0
(0..max_v).each do |v|
  nw = dp[N][v]
  ans = v if nw <= W
end
puts ans
