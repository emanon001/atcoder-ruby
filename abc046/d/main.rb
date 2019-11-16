S = gets.chomp.chars
score = 0
p_count = 0
S.reverse.each do |ch|
  g_count = S.size - p_count
  can_p = g_count - 1 >= p_count + 1
  if can_p
    score += ch == 'g' ? 1 : 0
    p_count += 1
  else
    score += ch == 'g' ? 0 : -1
  end
end
puts score
