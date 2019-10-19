N, A, B = gets.split.map(&:to_i)
xs = gets.split.map(&:to_i)
ans = 0
current = xs[0]
xs[0..-1].each do |x|
  ans += [(x - current) * A, B].min
  current = x
end
puts ans
