H, W = gets.split.map(&:to_i)
grid = H.times.map { gets.chomp.chars }

w_count = 0
H.times do |i|
  W.times do |j|
    w_count += 1 if grid[i][j] == '.'
  end
end

def steps(grid, si, sj)
  visited = Array.new(H) { Array.new(W, false) }
  visited[si][sj] = true
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]
  queue = [[si, sj, 1]]
  while !queue.empty?
    i, j, s = queue.shift
    4.times do |d|
      y = i + dy[d]
      x = j + dx[d]
      next if y < 0 || y >= H || x < 0 || x >= W
      next if grid[y][x] == '#'
      next if visited[y][x]
      visited[y][x] = true
      if y == H - 1 && x == W - 1
        return s + 1
      end
      queue.push([y, x, s + 1])
    end
  end
  nil
end

c = steps(grid, 0, 0)
ans = c ? w_count - c : -1
puts ans