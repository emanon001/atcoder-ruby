H, W, K = gets.split.map(&:to_i)
board = H.times.map { gets.chomp.chars }
h_pos = Array.new(H) { [] }
H.times do |i|
  W.times do |j|
    if board[i][j] == '#'
      h_pos[i].push(j)
    end
  end
end

top_blank_count = h_pos.take_while { |row| row.size == 0 }.size

ans = Array.new(H) { Array.new(W) }
k = 1
h_pos.each.with_index do |list, i|
  list.each.with_index do |j, li|
    left = li == 0 ? 0 : list[li - 1] + 1
    right = li == list.size - 1 ? W - 1 : list[li + 1] - 1
    top = top_blank_count >= i ? 0 : i
    bottom = i
    while bottom + 1 < H
      if h_pos[bottom + 1].size == 0
        bottom += 1
      else
        break
      end
    end
    (top..bottom).each do |i|
      (left..right).each do |j|
        ans[i][j] = k
      end
    end
    k += 1
  end
end
puts ans.map { |row| row.join(' ') }.join("\n")
