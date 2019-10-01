A, B, C = gets.split.map(&:to_i)
ans = B + [A + B + 1, C].min
puts ans
