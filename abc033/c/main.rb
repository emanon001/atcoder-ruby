S = gets.chomp
ans = S.split('+').map do |s|
  s.include?('0') ? 0 : 1
end.reduce(&:+)
puts ans
