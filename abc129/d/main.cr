h, w = gets.not_nil!.split.map(&.to_i)
board = h.times.map { gets.not_nil!.chomp.chars }.to_a

# left
left_sum_list = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  count = 0
  w.times do |j|
    cell = board[i][j]
    count = cell == '#' ? 0 : count + 1
    left_sum_list[i][j] = count
  end
end
# right
right_sum_list = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  count = 0
  w.times do |j|
    j = w - j - 1
    cell = board[i][j]
    count = cell == '#' ? 0 : count + 1
    right_sum_list[i][j] = count
  end
end
# top
top_sum_list = Array.new(w) { Array.new(h, 0) }
w.times do |i|
  count = 0
  h.times do |j|
    cell = board[j][i]
    count = cell == '#' ? 0 : count + 1
    top_sum_list[i][j] = count
  end
end
# bottom
bottom_sum_list = Array.new(w) { Array.new(h, 0) }
w.times do |i|
  count = 0
  h.times do |j|
    j = h - j - 1
    cell = board[j][i]
    count = cell == '#' ? 0 : count + 1
    bottom_sum_list[i][j] = count
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
