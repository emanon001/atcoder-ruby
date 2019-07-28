require 'set'
MOD = 10 ** 9 + 7
N, M = gets.split.map(&:to_i)
a_list = M.times.map { gets.to_i }
a_set = Set.new(a_list)

dp = Array.new(N + 1) { 0 }
dp[0] = 1
(0..(N - 1)).each do |i|
  next if a_set.include?(i)
  j = i + 1
  if !a_set.include?(j)
    dp[j] = (dp[j] + dp[i]) % MOD
  end
  j = i + 2
  if j <= N && !a_set.include?(j)
    dp[j] = (dp[j] + dp[i]) % MOD
  end
end
puts dp[N]
