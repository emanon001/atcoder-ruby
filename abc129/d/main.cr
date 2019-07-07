h, w = gets.not_nil!.split.map(&.to_i)
board = h.times.map { gets.not_nil!.chomp.chars }.to_a
horizontal_sum_list = Array(Array(Int32)).new
board.each_with_index do |row, i|
  l = r = nil
  sum_list = Array(Int32).new(w, 0)
  row.each_with_index do |ch, j|
    if ch == '#'
      if l && r
        count = r - l
        (l..r).each do |ii|
          sum_list[ii] = count
        end
      end
      l = r = nil
    else
      l = l ? l : j
      r = r ? r + 1 : j
      if j == w - 1
        count = r - l
        (l..r).each do |jj|
          sum_list[jj] = count
        end
      end
    end
  end
  horizontal_sum_list.push(sum_list)
end

vertical_sum_list = Array(Array(Int32)).new
h.times { |i| vertical_sum_list.push(Array(Int32).new(w, 0)) }
w.times do |j|
  t = b = nil
  h.times do |i|
    ch = board[i][j]
    if ch == '#'
      if t && b
        count = b - t
        (t..b).each do |ii|
          vertical_sum_list[ii][j] = count
        end
      end
      t = b = nil
    else
      t = t ? t : i
      b = b ? b + 1 : i
      if i == h - 1
        count = b - t
        (t..b).each do |ii|
          vertical_sum_list[ii][j] = count
        end
      end
    end
  end
end

ans = 0
h.times do |i|
  w.times do |j|
    if board[i][j] == '.'
      sum = horizontal_sum_list[i][j] + vertical_sum_list[i][j] + 1
      ans = sum if sum > ans
    end
  end
end
puts ans
