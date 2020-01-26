H, N = gets.split.map(&:to_i)
AB = N.times.map { gets.split.map(&:to_i) }

INF = 1 << 60
HMAX = H + 10 ** 4
dp = Array.new(N + 10) { Array.new(HMAX + 10, INF) }
dp[0][0] = 0
N.times do |i|
  a, b = AB[i]
  (0..HMAX).each do |j|
    base = dp[i][j]
    if j < a
      dp[i + 1][j] = base
    else
      next_v = dp[i + 1][j - a] + b
      dp[i + 1][j] = next_v < base ? next_v : base
    end
  end
end
ans = 1 << 60
l = dp[N]
(H..HMAX).each do |i|
  cost = l[i]
  ans = cost if cost < ans
end
puts ans