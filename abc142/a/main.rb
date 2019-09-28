N = gets.to_i
ans = N.even? ? 0.5 : (N / 2 + 1).to_f / N
puts ans
