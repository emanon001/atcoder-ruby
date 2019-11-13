N = gets.to_i
lrs = N.times.map { gets.split.map(&:to_i) }
ans = lrs.reduce(0) do |acc, (l, r)|
  acc + (r - l + 1)
end
puts ans
