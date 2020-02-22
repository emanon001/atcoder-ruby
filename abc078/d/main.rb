N, Z, W = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

INF = 1 << 60
def dfs(i, turn, dp)
  return dp[i][turn] if dp[i][turn]
  if turn == 0
    x = A[-1]
    y = i == 0 ? W : A[i - 1]
    ret = (y - x).abs
    min = INF
    ((i + 1)...N).each do |j|
      a = dfs(j, (turn + 1) % 2, dp)
      min = a if a < min
    end
    ret = min if min != INF && min > ret
  else
    x = A[i - 1]
    y = A[-1]
    ret = (y - x).abs
    max = -INF
    ((i + 1)...N).each do |j|
      a = dfs(j, (turn + 1) % 2, dp)
      max = a if a > max
    end
    ret = max if max != -INF && max > ret
  end
  dp[i][turn] = ret
end

dp = Array.new(N) { Array.new(2) }
puts dfs(0, 0, dp)