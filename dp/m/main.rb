N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

MOD = 10 ** 9 + 1

def dfs(i, k, dp)
  return dp[i][k] if dp[i][k]
  a = A[i]
  if i == 0
    return dp[i][k] = a >= k ? 1 : 0
  end
  ret = 0
  max_c = a > k ? k : a
  (0..max_c).each do |c|
    ret = (ret + dfs(i - 1, k - c, dp)) % MOD
  end
  dp[i][k] = ret
end

dp = Array.new(N) { Array.new(K + 1, nil) }
puts dfs(N - 1, K, dp)