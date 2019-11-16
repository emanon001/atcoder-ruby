N, M = gets.split.map(&:to_i)

if N >= M / 2
  puts M / 2
else
  diff = M - N * 2
  puts N + diff / 4
end
