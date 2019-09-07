N = gets.to_i
bs = gets.split.map(&:to_i)
ans = 0
n = 1 << 60
bs.each do |b|
  ans += [b, n].min
  n = b
end
ans += n
puts ans
