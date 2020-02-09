N, M = gets.split.map(&:to_i)

def to_bits(c)
  ret = 0
  c.each do |n|
    n -= 1
    ret += 2 ** n
  end
  ret
end

AC = M.times.map do
  a, b = gets.split.map(&:to_i)
  c = gets.split.map(&:to_i)
  [a, to_bits(c)]
end

INF = 1 << 60
FIN = (1 << N) - 1
def dfs(state, dp)
  return dp[state] if dp[state]
  return dp[state] = 0 if state == FIN
  ret = INF
  AC.each do |a, c|
    if state | c != state
      cost = dfs(state | c, dp) + a
      ret = cost if cost < ret
    end
  end
  dp[state] = ret
end

dp = Array.new(1 << N)
ans = dfs(0, dp)
if ans == INF
  puts -1
else
  puts ans
end