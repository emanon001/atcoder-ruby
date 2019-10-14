H, W = gets.split.map(&:to_i)
N = gets.to_i
as = gets.split.map(&:to_i)

board = Array.new(H) { Array.new(W) }
i, j = 0, 0
dx = 1
as.each.with_index do |a, c|
  c += 1
  a.times do
    board[i][j] = c
    if dx == 1 && j == W - 1
      i += 1
      dx = -1
    elsif dx == -1 && j == 0
      i += 1
      dx = 1
    else
      j += dx
    end
  end
end
puts board.map { |row| row.join(' ') }.join("\n")
