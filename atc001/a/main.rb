H, W = gets.split.map(&:to_i)
BOARD = H.times.map { gets.chomp.chars }

start = nil
goal = nil
H.times do |i|
  W.times do |j|
    cell = BOARD[i][j]
    if cell == 's'
      start = [i, j]
    elsif cell == 'g'
      goal = [i, j]
    end
  end
end

visited = Array.new(H) { Array.new(W, false) }
visited[start[0]][start[1]] = true
queue = [start]
dx = [0, 1, 0, -1]
dy = [-1, 0, 1, 0]
while !queue.empty?
  i, j = queue.shift
  4.times do |d|
    x = j + dx[d]
    y = i + dy[d]
    next if x < 0 || x >= W || y < 0 || y >= H
    next if visited[y][x]
    cell = BOARD[y][x]
    next if cell != '.' && cell != 'g'
    visited[y][x] = true
    queue.push([y, x])
  end
end
if visited[goal[0]][goal[1]]
  puts 'Yes'
else
  puts 'No'
end