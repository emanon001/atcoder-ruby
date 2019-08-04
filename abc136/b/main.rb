N = gets.to_i
ans = (1..N).count do |n|
  n.to_s.size.odd?
end
puts ans
