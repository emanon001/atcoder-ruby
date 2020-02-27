N, M = gets.split.map(&:to_i)
P = N.times.map { gets.to_i }

require 'set'
set = Set.new(P)
P.combination(2).each do |a, b|
  set.add(a + b)
end
sorted = set.to_a.sort
ans = 0
sorted.each do |a|
  next if a > M
  i = sorted.bsearch_index do |b|
    a + b > M 
  end
  b = if i
    i == 0 ? 0 : sorted[i - 1]
  else
    sorted[-1]
  end
  c = a + b
  ans = c if c > ans
end
puts ans