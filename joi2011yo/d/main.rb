N = gets.to_i
A = gets.split.map(&:to_i)
MAX = 20
dp = Array.new(N + 1) { Array.new(MAX + 1, 0) }
dp[1][A[0]] = 1
(1...(N - 1)).each do |i|
  a = A[i]
  (0..MAX).each do |j|
    c = dp[i][j]
    next if c == 0
    dp[i + 1][j + a] += c if j + a <= MAX
    dp[i + 1][j - a] += c if j - a >= 0
  end
end
puts dp[N - 1][A[-1]]