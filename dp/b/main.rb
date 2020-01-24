N, K = gets.split.map(&:to_i)
hs = gets.split.map(&:to_i)

INF = 1 << 60
dp = Array.new(N + K, INF)
dp[0] = 0
N.times do |i|
  n = dp[i]
  (1..K).each do |j|
    break if i + j >= N
    m = dp[i + j]
    cost = (hs[i] - hs[i + j]).abs
    dp[i + j] = n + cost if n + cost < m
  end
end
puts dp[N - 1]