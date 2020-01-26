N = gets.to_i
P = gets.split.map(&:to_i)

MAX_P = 100 * N
dp = Array.new(N + 10) { Array.new(MAX_P + 10, false) }
dp[0][0] = true
N.times do |i|
  point = P[i]
  (0..MAX_P).each do |j|
    current = dp[i][j]
    dp[i + 1][j] ||= current
    next unless current
    next if j + point > MAX_P
    dp[i + 1][j + point] = true
  end
end
ans = dp[N].count(&:itself)
puts ans