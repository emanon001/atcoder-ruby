N = gets.to_i
abc_list = N.times.map { gets.split.map(&:to_i) }
dp = Array.new(N + 10)
dp[0] = { a: 0, b: 0, c: 0 }
N.times do |i|
  a, b, c = abc_list[i]
  dp[i + 1] = {}
  dp[i + 1][:a] = [
    dp[i][:b] + a,
    dp[i][:c] + a
  ].max
  dp[i + 1][:b] = [
    dp[i][:a] + b,
    dp[i][:c] + b
  ].max
  dp[i + 1][:c] = [
    dp[i][:a] + c,
    dp[i][:b] + c
  ].max
end
puts dp[N].values.max
