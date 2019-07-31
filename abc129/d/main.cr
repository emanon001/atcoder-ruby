h, w = gets.not_nil!.split.map(&.to_i)
board = h.times.map { gets.not_nil!.chomp.chars }.to_a

# horizontal
left_sum_list = Array.new(h) { Array.new(w, 0) }
right_sum_list = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  left_count = 0
  right_count = 0
  w.times do |j|
    # left
    cell = board[i][j]
    left_count = if cell == '#'
      0
    else
      left_count + 1
    end
    left_sum_list[i][j] = left_count
    # right
    j = w - j - 1
    cell = board[i][j]
    right_count = if cell == '#'
      0
    else
      right_count + 1
    end
    right_sum_list[i][j] = right_count
  end
end
# vertical
top_sum_list = Array.new(w) { Array.new(h, 0) }
bottom_sum_list = Array.new(w) { Array.new(h, 0) }
w.times do |i|
  top_count = 0
  bottom_count = 0
  h.times do |j|
    # top
    cell = board[j][i]
    top_count = if cell == '#'
      0
    else
      top_count + 1
    end
    top_sum_list[i][j] = top_count
    # buttom
    j = h - j - 1
    cell = board[j][i]
    bottom_count = if cell == '#'
      0
    else
      bottom_count + 1
    end
    bottom_sum_list[i][j] = bottom_count
  end
end
ans = -1
h.times do |i|
  w.times do |j|
    cell = board[i][j]
    next if cell == '#'
    sum = left_sum_list[i][j] - 1 +
      right_sum_list[i][j] - 1 +
      top_sum_list[j][i] - 1 +
      bottom_sum_list[j][i] - 1 + 1
    ans = sum if sum > ans
  end
end
puts ans
