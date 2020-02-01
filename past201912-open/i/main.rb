N, M = gets.split.map(&:to_i)
def to_bits(s)
  s.gsub('Y', '1').gsub('N', '0').to_i(2)
end

SC = M.times.map do
  s, c = gets.chomp.split
  [to_bits(s), c.to_i]
end

INF = 1 << 60
FIN = (1 << N) - 1
def dfs(state, dp)
  return dp[state] if dp[state]
  ret = INF
  M.times do |i|
    s, c = SC[i]
    if state | s != state
      v = dfs(state | s, dp) + c
      ret = v if v < ret
    end
  end
  dp[state] = ret
end
dp = Array.new(1 << N, nil)
dp[FIN] = 0
ans = dfs(0, dp)
puts(ans == INF ? -1 : ans)