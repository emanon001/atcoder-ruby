S = gets.chomp.chars
list = Array.new(S.size)
loop_l = nil
last_loop_l = nil
S.each.with_index do |ch, i|
  if ch == 'R'
    if loop_l == nil
      loop_l = i
      last_loop_l = i
    else
      last_loop_l = i
    end
  elsif ch == 'L'
    if loop_l != nil
      (last_loop_l..i).each do |j|
        list[j] = [0, j == i ? :left : :right]
      end
      (last_loop_l - 1).downto(loop_l) do |j|
        c, _ = list[j + 1]
        list[j] = [c + 1, :right]
      end
      loop_l = last_loop_l = nil
    else
      c, _ = list[i - 1]
      list[i] = [c + 1, :left]
    end
  end
end
ans = Array.new(S.size) { 0 }
(0...(S.size)).each do |i|
  distance, direction = list[i]
  if direction == :right
    start = i + distance
    if distance.odd?
      ans[start + 1] += 1
    else
      ans[start] += 1
    end
  else
    start = i - distance
    if distance.odd?
      ans[start - 1] += 1
    else
      ans[start] += 1
    end
  end
end
puts ans.join(' ')
