A, B = gets.split.map(&:to_i)
ans = [A - B * 2, 0].max
puts ans
