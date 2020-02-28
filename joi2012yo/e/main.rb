W, H = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }

def plus(board, si, sj, used)
  used[si][sj] = true
  queue = [[si, sj]]
  dy = [-1, 0, 1, 1, 0, -1]
  even_dx = [1, 1, 1, 0, -1, 0]
  odd_dx = [0, 1, 0, -1, -1, -1]
  res = 6
  while !queue.empty?
    i, j = queue.shift
    6.times do |d|
      y = i + dy[d]
      x = j + (i.even? ? even_dx[d] : odd_dx[d])
      next if y < 0 || y >= H || x < 0 || x >= W
      next if board[y][x] == 0
      next if used[y][x]
      used[y][x] = true
      queue.push([y, x])
      res += 6
      c = 6.times.count do |d|
        y2 = y + dy[d]
        x2 = x + (y.even? ? even_dx[d] : odd_dx[d])
        next false if y2 < 0 || y2 >= H || x2 < 0 || x2 >= W
        used[y2][x2]
      end
      res -= (c * 2)
    end
  end
  res
end

def minus(board, si, sj, used)
  reached_wall = si == 0 || si == H - 1 || sj == 0 || sj == W - 1
  used[si][sj] = true
  queue = [[si, sj]]
  dy = [-1, 0, 1, 1, 0, -1]
  even_dx = [1, 1, 1, 0, -1, 0]
  odd_dx = [0, 1, 0, -1, -1, -1]
  res = 6
  while !queue.empty?
    i, j = queue.shift
    6.times do |d|
      y = i + dy[d]
      x = j + (i.even? ? even_dx[d] : odd_dx[d])
      next if y < 0 || y >= H || x < 0 || x >= W
      next if board[y][x] == 1
      next if used[y][x]
      used[y][x] = true
      reached_wall = true if y == 0 || y == H - 1 || x == 0 || x == W - 1
      queue.push([y, x])
      res += 6
      c = 6.times.count do |d|
        y2 = y + dy[d]
        x2 = x + (y.even? ? even_dx[d] : odd_dx[d])
        next false if y2 < 0 || y2 >= H || x2 < 0 || x2 >= W
        used[y2][x2]
      end
      res -= (c * 2)
    end
  end
  reached_wall ? 0 : res
end

used = Array.new(H) { Array.new(W, false) }
res = 0
H.times do |i|
  W.times do |j|
    next if used[i][j]
    next if board[i][j] == 0
    res += plus(board, i, j, used)
  end
end
used2 = Array.new(H) { Array.new(W, false) }
H.times do |i|
  W.times do |j|
    next if used2[i][j]
    next if board[i][j] == 1
    res -= minus(board, i, j, used2)
  end
end
puts res