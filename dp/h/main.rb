H, W = gets.split.map(&:to_i)
grid = H.times.map { gets.chomp.chars }

dp = Array.new(H) { Array.new(W, nil) }
dp[0][0] = 1

def dfs(i, j, dp, grid)
  return dp[i][j] if dp[i][j]
  ret = 0
  ret += dfs(i - 1, j, dp, grid) if i > 0 && grid[i - 1][j] == '.'
  ret += dfs(i, j - 1, dp, grid) if j > 0 && grid[i][j - 1] == '.'
  dp[i][j] = ret
end

MOD = 10 ** 9 + 7
puts dfs(H - 1, W - 1, dp, grid) % MOD