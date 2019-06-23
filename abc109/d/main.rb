H, W = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }

op_list = []
(H - 1).times do |i|
  y = i + 1
  W.times do |j|
    x = j + 1
    if board[i][j].odd?
      op_list.push([y, x, y + 1, x])
      board[i + 1][j] += 1
    end
  end
end
(W - 1).times do |j|
  i = H - 1
  y = H
  x = j + 1
  if board[i][j].odd?
    op_list.push([y, x, y, x + 1])
    board[i][j + 1] += 1
  end
end

puts op_list.size
puts op_list.map { |op| op.join(' ') }.join("\n")
