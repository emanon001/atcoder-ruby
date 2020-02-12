N = gets.to_i
P = gets.split.map(&:to_i)

MAX_P = 100 * N
dp = Array.new(N + 1) { Array.new(MAX_P + 1, 0) }
dp[0][0] = 1
N.times do |i|
  point = P[i]
  (0..MAX_P).each do |j|
    new_c = dp[i][j]
    new_c += dp[i][j - point] if j - point >= 0
    dp[i + 1][j] = new_c
  end
end
ans = dp[N].count { |c| c > 0 }
puts ans