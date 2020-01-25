N = gets.to_i
A = gets.split.map(&:to_i)

INF = 1 << 60
dp = Array.new(N + 10, INF)
dp[0] = 0

N.times do |i|
  current = dp[i]
  a = A[i]
  if i + 1 < N
    b = A[i + 1]
    v = current + (a - b).abs
    dp[i + 1] = v if v < dp[i + 1]
  end
  if i + 2 < N
    b = A[i + 2]
    v = current + (a - b).abs
    dp[i + 2] = v if v < dp[i + 2]
  end
end
puts dp[N - 1]