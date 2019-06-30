H, W = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }
MOD = 10 ** 9 + 7

MEMO = {}
def dfs(board, i, j)
  return MEMO[[i, j]] if MEMO[[i, j]]
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]
  count = 1
  4.times do |ii|
    y = i + dy[ii]
    x = j + dx[ii]
    next unless y >= 0 && y < H && x >= 0 && x < W
    next unless board[i][j] > board[y][x]
    count += dfs(board, y, x) % MOD
  end
  MEMO[[i, j]] = count
end

ans = 0
(0...H).each do |i|
  (0...W).each do |j|
    ans += dfs(board, i, j) % MOD
  end
end
puts ans
