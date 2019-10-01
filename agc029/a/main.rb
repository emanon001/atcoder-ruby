S = gets.chomp.chars
b_count = 0
ans = 0
S.each do |ch|
  if ch == 'W'
    ans += b_count
  else
    b_count += 1
  end
end
puts ans
