s = gets.chomp.chars
t = gets.chomp.chars
dp = Array.new(s.size + 1) { Array.new(t.size + 1, nil) }

def dfs(s, t, i, j, dp)
  return 0 if i < 0 || j < 0
  return dp[i][j] = 0 if i == 0 || j == 0
  return dp[i][j] if dp[i][j]
  if s[i - 1] == t[j - 1]
    return dp[i][j] = dfs(s, t, i - 1, j - 1, dp) + 1
  else
    a = dfs(s, t, i, j - 1, dp)
    b = dfs(s, t, i - 1, j, dp)
    return dp[i][j] = a > b ? a : b
  end
end
dfs(s, t, s.size, t.size, dp)
ans = []
i = s.size
j = t.size
while i > 0 && j > 0
  if dp[i][j] == dp[i - 1][j]
    i -= 1
  elsif dp[i][j] == dp[i][j - 1]
    j -= 1
  else
    ans.push(s[i - 1])
    i -= 1
    j -= 1
  end
end
puts ans.reverse.join('')