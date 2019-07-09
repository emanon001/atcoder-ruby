N, K = gets.split.map(&:to_i)
h_list = gets.split.map(&:to_i)
INF = 2 << 60
dp = Array.new(N + 10) { INF }
dp[0] = 0
(N - 1).times do |i|
  (1..K).each do |k|
    next if i + k >= N
    cost = dp[i] + (h_list[i] - h_list[i + k]).abs
    dp[i + k] = cost if cost < dp[i + k]
  end
end
puts dp[N - 1]
