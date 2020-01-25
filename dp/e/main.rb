N, W = gets.split.map(&:to_i)
wvs = N.times.map { gets.split.map(&:to_i) }

INF = 1 << 60
VN = 10 ** 3 * N
dp = Array.new(N + 1) { Array.new(VN + 10, INF) }
dp[0][0] = 0

N.times do |i|
  w, v = wvs[i]
  (0..VN).each do |j|
    dp[i + 1][j] = if j < v
      dp[i][j]
    else
      base = dp[i][j - v]
      current = dp[i][j]
      base + w < current ? base + w : current
    end
  end
end
ans = 0
dp[N].each.with_index do |w, v|
  ans = v if w <= W
end
puts ans