N = gets.to_i
P = gets.split.map(&:to_f)

dp = Array.new(N + 10) { Array.new(N + 10, 0) }
dp[0][0] = 1.0
N.times do |i|
  per = P[i]
  (0..i).each do |j|
    current = dp[i][j]
    dp[i + 1][j + 1] += current * per
    dp[i + 1][j] += current * (1 - per)
  end
end
ans = 0
(((N + 1) / 2)..N).each do |c|
  ans += dp[N][c]
end
puts ans