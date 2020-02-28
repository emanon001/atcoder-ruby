M = gets.to_i
N = gets.to_i
board = N.times.map { gets.split.map(&:to_i) }

def bfs(board, i, j)
  res = 1
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]
  visited = Array.new(N) { Array.new(M, false) }
  visited[i][j] = true
  queue = [[i, j, 1, visited]]
  while !queue.empty?
    i, j, c, visited = queue.shift
    4.times do |d|
      y = i + dy[d]
      x = j + dx[d]
      next if y < 0 || y >= N || x < 0 || x >= M
      next if board[y][x] == 0
      next if visited[y][x]
      new_visited = visited.map { |row| row.dup }
      new_visited[y][x] = true
      new_c = c + 1
      res = new_c if new_c > res
      queue.push([y, x, new_c, new_visited])
    end
  end
  res
end

res = 0
N.times do |i|
  M.times do |j|
    next if board[i][j] == 0
    c = bfs(board, i, j)
    res = c if c > res
  end
end
puts res