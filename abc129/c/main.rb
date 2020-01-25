require 'set'

N, M = gets.split.map(&:to_i)
A = Set.new(M.times.map { gets.to_i })
MOD = 10 ** 9 + 7
dp = Array.new(N + 10, 0)
dp[0] = 1
N.times do |i|
  next if A.include?(i)
  if i + 1 <= N && !A.include?(i + 1)
    dp[i + 1] = (dp[i + 1] + dp[i]) % MOD
  end
  if i + 2 <= N && !A.include?(i + 2)
    dp[i + 2] = (dp[i + 2] + dp[i]) % MOD
  end
end
puts dp[N]