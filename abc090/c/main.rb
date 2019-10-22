N, M = gets.split.map(&:to_i)

if N == 1 && M == 1
  puts 1
elsif N == 1
  puts M - 2
elsif M == 1
  puts N - 2
else
  puts (N - 2) * (M - 2)
end
