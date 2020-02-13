N, M, L, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

def min(a, b)
  a < b ? a : b
end

INF = 1 << 60
MAX_M = 1000
dp = Array.new(N + 1) { Array.new(MAX_M, INF) }
dp[0][0] = 1
N.times do |i|
  a = A[i]
  MAX_M.times do |j|
    current = dp[i][j]
    next if current == INF
    dp[i + 1][j] = min(dp[i + 1][j], current)
    dp[i + 1][(j + a) % M] = min(dp[i + 1][(j + a) % M], current + (j + a) / M)
  end
end
puts(dp[N][L] <= X ? 'Yes' : 'No')