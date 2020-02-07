N, T = gets.split.map(&:to_i)
AB = N.times.map { gets.split.map(&:to_i) }.sort

dp = Array.new(N + 10) { Array.new(T + 10, 0) }
N.times do |i|
  a, b = AB[i]
  (0...T).each do |j|
    v = dp[i][j]
    if v > dp[i + 1][j]
      dp[i + 1][j] = v
    end
    next if j + a > T
    if v + b > dp[i + 1][j + a]
      dp[i + 1][j + a] = v + b
    end
  end
end
ans = 0
(1..N).each do |i|
  v = dp[i - 1][T - 1] + AB[i - 1][1]
  ans = v if v > ans
end
puts ans