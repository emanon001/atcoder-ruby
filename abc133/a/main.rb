N, A, B = gets.split.map(&:to_i)
ans = [B, A * N].min
puts ans
