H, W, N = gets.split.map(&:to_i)
BOARD = H.times.map { gets.chomp.chars }

pos = {}
H.times do |i|
  W.times do |j|
    cell = BOARD[i][j]
    if cell == 'S' || (cell.to_i > 0 && cell.to_i <= N)
      pos[cell] = [i, j]
    end
  end
end

def shortest_path(s, e, pos)
  s_pos = pos[s]
  visited = Array.new(H) { Array.new(W, false) }
  visited[s_pos[0]][s_pos[1]] = true
  dx = [0, 1, 0, -1]
  dy = [-1, 0, 1, 0]
  queue = [[s_pos, 0]]
  while !queue.empty?
    (i, j), step = queue.shift
    4.times do |d|
      y = i + dy[d]
      x = j + dx[d]
      next if y < 0 || y >= H || x < 0 || x >= W
      next if visited[y][x]
      cell = BOARD[y][x]
      next if cell == 'X'
      if cell == e
        return step + 1
      end
      visited[y][x] = true
      queue.push([[y, x], step + 1])
    end
  end
end

ans = 0
N.times do |i|
  s = i == 0 ? 'S' : i.to_s
  e = (i + 1).to_s
  ans += shortest_path(s, e, pos)
end
puts ans