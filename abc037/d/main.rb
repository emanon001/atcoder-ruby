H, W = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }
MOD = 10 ** 9 + 7

dx = [0, 1, 0, -1]
dy = [1, 0, -1, 0]
DXY = dx.zip(dy).to_a

def dfs(i, j, dp, board)
  return dp[i][j] if dp[i][j]
  a = board[i][j]
  ret = 1
  DXY.each do |dx, dy|
    ii = i + dy
    jj = j + dx
    if ii >= 0 && ii < H && jj >= 0 && jj < W && board[ii][jj] > a
      ret = (ret + dfs(i + dy, j + dx, dp, board)) % MOD
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