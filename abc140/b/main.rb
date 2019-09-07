N = gets.to_i
as = gets.split.map(&:to_i)
bs = gets.split.map(&:to_i)
cs = gets.split.map(&:to_i)
ans = 0
prev = -2
as.each do |a|
  a -= 1
  ans += bs[a]
  ans += cs[prev] if prev + 1 == a
  prev = a
end
puts ans
