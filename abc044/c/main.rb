N, A = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)

dp = Array.new(N + 1) { Array.new(N + 1) { Array.new(N * 50 + 1, 0) } }
dp[0][0][0] = 1
N.times do |i|
  x = X[i]
  (i + 1).times do |j|
    (0..(50 * j)).each do |k|
      c = dp[i][j][k]
      dp[i + 1][j][k] += c
      dp[i + 1][j + 1][k + x] += c
    end
  end
end
ans = 0
(1..N).each do |i|
  ans += dp[N][i][i * A]
end
puts ans