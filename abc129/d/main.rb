H, W = gets.split.map(&:to_i)
board = H.times.map { gets.chomp.chars }
horizontal_sum_list = Array.new(H)
board.each.with_index do |row, i|
  l = r = nil
  sum_list = Array.new(W)
  row.each.with_index do |ch, i|
    if ch == '#'
      if l != nil && r != nil
        count = r - l
        (l..r).each do |ii|
          sum_list[ii] = count
        end
      end
      l = r = nil
    else
      l = l ? l : i
      r = r ? r + 1 : i
      if i == W - 1
        count = r - l
        (l..r).each do |ii|
          sum_list[ii] = count
        end
      end
    end
  end
  horizontal_sum_list[i] = sum_list
end

vertical_sum_list = Array.new(H)
H.times { |i| vertical_sum_list[i] = Array.new(W) }
W.times do |j|
  t = b = nil
  H.times do |i|
    ch = board[i][j]
    if ch == '#'
      if t != nil && b != nil
        count = b - t
        (t..b).each do |ii|
          vertical_sum_list[ii][j] = count
        end
      end
      t = b = nil
    else
      t = t ? t : i
      b = b ? b + 1 : i
      if i == H - 1
        count = b - t
        (t..b).each do |ii|
          vertical_sum_list[ii][j] = count
        end
      end
    end
  end
end

ans = 0
H.times do |i|
  W.times do |j|
    if board[i][j] == '.'
      sum = horizontal_sum_list[i][j] + vertical_sum_list[i][j] + 1
      ans = sum if sum > ans
    end
  end
end
puts ans
