N = gets.to_i
A, B = gets.split.map(&:to_i)
C = gets.to_i
D = N.times.map { gets.to_i }

def max(a, b)
  a > b ? a : b
end

dp = Array.new(N + 1) { Array.new(N + 1, 0) }
dp[0][0] = C
N.times do |i|
  d = D[i]
  (0..i).each do |j|
    dp[i + 1][j] = max(dp[i + 1][j], dp[i][j])
    dp[i + 1][j + 1] = max(dp[i + 1][j + 1], dp[i][j] + d)
  end
end
ans = 0
(0..N).each do |i|
  v = dp[N][i] / (A + i * B)
  ans = v if v > ans
end
puts ans