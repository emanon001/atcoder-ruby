M = gets.to_i
N = gets.to_i
board = N.times.map { gets.split.map(&:to_i) }

def dfs(board, i, j, visited)
  res = 1
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]
  visited[i][j] = true
  res = 0
  4.times do |d|
    y = i + dy[d]
    x = j + dx[d]
    next if y < 0 || y >= N || x < 0 || x >= M
    next if board[y][x] == 0
    next if visited[y][x]
    c = dfs(board, y, x, visited)
    res = c if c > res
    visited[y][x] = false
  end
  res + 1
end

res = 0
visited = Array.new(N) { Array.new(M, false) }
N.times do |i|
  M.times do |j|
    next if board[i][j] == 0
    c = dfs(board, i, j, visited)
    visited[i][j] = false
    res = c if c > res
  end
end
puts res