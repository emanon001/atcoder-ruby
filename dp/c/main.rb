N = gets.to_i
abcs = N.times.map { gets.split.map(&:to_i) }

dp = Array.new(N + 10) { Array.new(3, 0) }
N.times do |i|
  a, b, c = abcs[i]
  da, db, dc = dp[i]
  dp[i + 1] = [
    [db + a, dc + a].max,
    [da + b, dc + b].max,
    [da + c, db + c].max
  ]
end
puts dp[N].max