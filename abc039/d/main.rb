require 'set'
H, W = gets.split.map(&:to_i)
board = H.times.map { gets.chomp.chars }

def turn(board, from, to)
  board = board.map(&:dup)
  dy = [-1, 0, 1]
  dx = [-1, 0, 1]
  turned = Set.new
  H.times do |i|
    W.times do |j|
      next if board[i][j] == from
      next if turned.include?([i, j])
      dy.each do |y|
        dx.each do |x|
          ii = i + y
          jj = j + x
          if (ii >= 0 && ii < H && jj >= 0 && jj < W) && board[ii][jj] == from
            board[ii][jj] = to
            turned.add([ii, jj])
          end
        end
      end
    end
  end
  board
end
board1 = turn(board, '#', '.')
board2 = turn(board1, '.', '#')
is_possible = board == board2
puts(is_possible ? 'possible' : 'impossible')
if is_possible
  puts board1.map { |row| row.join('') }.join("\n")
end
