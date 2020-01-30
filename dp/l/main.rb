N = gets.to_i
A = gets.split.map(&:to_i)

def dfs(i, j, dp)
  return dp[i][j] if dp[i][j]
  return dp[i][j] = 0 if i == j
  if (N - (j - i)).even?
    a = dfs(i + 1, j, dp) + A[i]
    b = dfs(i, j - 1, dp) + A[j - 1]
    dp[i][j] = a > b ? a : b
  else
    a = dfs(i + 1, j, dp) - A[i]
    b = dfs(i, j - 1, dp) - A[j - 1]
    dp[i][j] = a < b ? a : b
  end
end
dp = Array.new(N + 1) { Array.new(N + 1, nil) }
ans = dfs(0, N, dp)
puts ans