n, k = gets.not_nil!.split.map(&.to_i)
h_list = gets.not_nil!.split.map(&.to_i)
INF = Int64::MAX
dp = Array.new(n + 10, INF)
dp[0] = 0
(n - 1).times do |i|
  (1..k).each do |kk|
    dp[i + kk] = [
      dp[i + kk],
      dp[i] + (h_list[i] - h_list[i + kk]).abs
    ].min if i + kk < n
  end
end
puts dp[n - 1]
