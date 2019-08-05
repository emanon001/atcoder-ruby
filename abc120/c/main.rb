S = gets.chomp.chars
count0 = 0
count1 = 0
S.each do |ch|
  if ch == '0'
    count0 += 1
  else
    count1 += 1
  end
end
puts([count0, count1].min * 2)
