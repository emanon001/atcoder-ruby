R, C = gets.split.map(&:to_i)
sy, sx = gets.split.map { |n| n.to_i - 1 }
gy, gx = gets.split.map { |n| n.to_i - 1 }
board = R.times.map { gets.chomp.chars }

dy = [-1, 0, 1, 0]
dx = [0, 1, 0, -1]
visited = Array.new(R) { Array.new(C, false) }
visited[sy][sx] = true
queue = [[sy, sx, 0]]
while !queue.empty?
  i, j, c = queue.shift
  4.times do |d|
    y = i + dy[d]
    x = j + dx[d]
    next if y < 0 || y >= R || x < 0 || x >= C
    next if board[y][x] == '#'
    next if visited[y][x]
    visited[y][x] = true
    new_c = c + 1
    if y == gy && x == gx
      puts new_c
      exit 0
    end
    queue.push([y, x, new_c])
  end
end