N, K, M = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)
sum = as.reduce(0, &:+)
rest = N * M - sum
if rest <= K
  puts [rest, 0].max
else
  puts -1
end