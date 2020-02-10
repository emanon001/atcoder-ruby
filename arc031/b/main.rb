H = 10
W = 10
BOARD = H.times.map { gets.chomp.chars }

def o_count(cell)
  dx = [0, 1, 0, -1]
  dy = [-1, 0, 1, 0]
  visited = Array.new(H) { Array.new(W, false) }
  visited[cell[0]][cell[1]] = true
  count = 0
  queue = [cell]
  while !queue.empty?
    i, j = queue.shift
    4.times do |d|
      x = j + dx[d]
      y = i + dy[d]
      next if x < 0 || x >= W || y < 0 || y >= H
      next if visited[y][x]
      cell = BOARD[y][x]
      next if cell == 'x'
      visited[y][x] = true
      count += 1
      queue.push([y, x])
    end
  end
  count
end

all_o_count = BOARD.reduce(0) do |acc, row|
  acc + row.count('o')
end
H.times do |i|
  W.times do |j|
    cell = BOARD[i][j]
    next if cell == 'o'
    if o_count([i, j]) == all_o_count
      puts 'YES'
      exit 0
    end
  end
end
puts 'NO'