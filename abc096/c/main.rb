H, W = gets.split.map(&:to_i)
board = H.times.map { gets.chomp.chars }
is_ok = H.times.all? do |i|
  W.times.all? do |j|
    cell = board[i][j]
    next true if cell == '.'
    (i > 0 && board[i - 1][j] == '#') ||
    (j < W - 1 && board[i][j + 1] == '#') ||
    (i < H - 1 && board[i + 1][j] == '#') ||
    (j > 0 && board[i][j - 1] == '#')
  end
end
puts(is_ok ? 'Yes' : 'No')
