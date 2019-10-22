A, B = gets.split.map(&:to_i)

ans = 0
(A..B).each do |n|
  ns = n.to_s.chars
  ans += 1 if ns == ns.reverse
end
puts ans
