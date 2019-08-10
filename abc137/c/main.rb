N = gets.to_i
table = Hash.new { 0 }
s_list = N.times.map { gets.chomp.chars }
ans = 0
s_list.each do |s|
  key = s.sort
  if table[key] > 0
    ans += table[key]
  end
  table[key] += 1
end
puts ans
