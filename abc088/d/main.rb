H, W = gets.split.map(&:to_i)
board = H.times.map { gets.chomp.chars }
w_count = board.map do |row|
  row.count('.')
end.reduce(&:+)

INF = 1 << 30
def bfs(board)
  cost = Array.new(H) do
    Array.new(W, INF)
  end
  cost[0][0] = 1
  ys = [-1, 0, 1]
  xs = [-1, 0, 1]
  queue = [[0, 0, 1]]
  while !queue.empty?
    i, j, c = queue.shift
    ys.each do |y|
      ii = i + y
      next if ii < 0 || ii >= H
      xs.each do |x|
        next if y != 0 && x != 0
        jj = j + x
        next if jj < 0 || jj >= W
        next if board[ii][jj] == '#'
        if c + 1 < cost[ii][jj]
          cost[ii][jj] = c + 1
          queue.push([ii, jj, c + 1])
        end
      end
    end
  end
  cost[H - 1][W - 1]
end

cost = bfs(board)
if cost == INF
  puts -1
  exit 0
end
ans = w_count - cost
puts ans
