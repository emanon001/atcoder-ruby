N, D = gets.split.map(&:to_i)
n = N / (D * 2 + 1)
ans = n + (N % (D * 2 + 1) == 0 ? 0 : 1)
puts ans
