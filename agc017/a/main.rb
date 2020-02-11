N, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

dp = Array.new(N + 10) { Array.new(2, 0) }
dp[0][0] = 1
N.times do |i|
  a = A[i]
  dp[i + 1][0] = dp[i][0]
  dp[i + 1][1] = dp[i][1]
  if a.even?
    dp[i + 1][0] += dp[i][0]
    dp[i + 1][1] += dp[i][1]
  else
    dp[i + 1][1] += dp[i][0]
    dp[i + 1][0] += dp[i][1]
  end
end
puts dp[N][P]