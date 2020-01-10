N = gets.to_i
ps = gets.split.map(&:to_i)
qs = gets.split.map(&:to_i)

sorted = (1..N).to_a.permutation(N).sort
puts (sorted.index(ps) - sorted.index(qs)).abs