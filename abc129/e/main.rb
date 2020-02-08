L = gets.chomp.chars.map(&:to_i)

MOD = 10 ** 9 + 7
dp = Array.new(L.size + 1) { Array.new(2, 0) }
dp[0][0] = 0
dp[0][1] = 1
L.size.times do |i|
  bit = L[i]
  if bit == 0
    dp[i + 1][0] = (dp[i][0] * 3) % MOD
    dp[i + 1][1] = dp[i][1]
  else
    dp[i + 1][0] = (dp[i][0] * 3 + dp[i][1]) % MOD
    dp[i + 1][1] = (dp[i][1] * 2) % MOD
  end
end
puts (dp[L.size][0] + dp[L.size][1]) % MOD