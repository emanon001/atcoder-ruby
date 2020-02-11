R, C = gets.split.map(&:to_i)
START = gets.split.map { |s| s.to_i - 1 }
GOAL = gets.split.map { |s| s.to_i - 1 }
BOARD = R.times.map { gets.chomp.chars }

def minimum_step
  visited = Array.new(R) { Array.new(C, false) }
  dx = [0, 1, 0, -1]
  dy = [-1, 0, 1, 0]
  queue = [[START, 0]]
  while !queue.empty?
    (y, x), step = queue.shift
    4.times do |d|
      y2 = y + dy[d]
      x2 = x + dx[d]
      next if y2 < 0 || y2 >= R || x2 < 0 || x2 >= C
      next if visited[y2][x2]
      new_step = step + 1
      return new_step if [y2, x2] == GOAL
      cell = BOARD[y2][x2]
      next if cell == '#'
      visited[y2][x2] = true
      queue.push([[y2, x2], new_step])
    end
  end
end

puts minimum_step