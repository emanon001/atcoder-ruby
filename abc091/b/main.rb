N = gets.to_i
S = N.times.map { gets.chomp }
M = gets.to_i
T = M.times.map { gets.chomp }

s_count = Hash.new { 0 }
t_count = Hash.new { 0 }

S.each do |s|
  s_count[s] += 1
end
T.each do |s|
  t_count[s] += 1
end

ans = 0
s_count.each do |s, c|
  point = c - t_count[s]
  ans = point if point > ans
end
puts ans