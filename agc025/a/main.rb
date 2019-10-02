N = gets.to_i
ans = 1 << 60
(1..(N / 2)).each do |n|
  m = N - n
  a = n.to_s.chars.map(&:to_i).reduce(&:+)
  b = m.to_s.chars.map(&:to_i).reduce(&:+)
  c = a + b
  ans = c if c < ans
end
puts ans
