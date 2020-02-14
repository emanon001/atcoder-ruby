H, W = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }

MOD = 10 ** 9 + 7

DYX = [-1, 0, 1, 0].zip([0, 1, 0, -1]).to_a

def dfs(i, j, dp, board)
  return dp[i][j] if dp[i][j]
  ret = 1
  from = board[i][j]
  DYX.each do |dy, dx|
    ii = i + dy
    jj = j + dx
    next if ii < 0 || ii >= H || jj < 0 || jj >= W
    to = board[ii][jj]
    if from > to
      ret = (ret + dfs(ii, jj, dp, board)) % MOD
    end
  end
  dp[i][j] = ret
end

dp = Array.new(H) { Array.new(W, nil) }
ans = 0
H.times do |i|
  W.times do |j|
    ans = (ans + dfs(i, j, dp, board)) % MOD
  end
end
puts ans