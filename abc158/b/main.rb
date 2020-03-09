N, A, B = gets.split.map(&:to_i)
c = N / (A + B)
rest = N - (A + B) * c
ans = A * c + [rest, A].min
puts ans