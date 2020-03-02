N, M = gets.split.map(&:to_i)
D = N.times.map { gets.to_i }
C = M.times.map { gets.to_i }

def min(a, b); a < b ? a : b; end

INF = 1 << 60
dp = Array.new(M + 1) { Array.new(N + 1, INF) }
dp[0][0] = 0
M.times do |i|
  c = C[i]
  (N + 1).times do |j|
    dp[i + 1][j] = min(dp[i + 1][j], dp[i][j])
    if j < N
      d = D[j]
      dp[i + 1][j + 1] = min(dp[i + 1][j + 1], dp[i][j] + d * c)
    end
  end
end

ans = INF
(M + 1).times do |i|
  n = dp[i][N]
  ans = n if n < ans
end
puts ans