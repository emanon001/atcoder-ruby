S = gets.chomp.chars
T = gets.chomp.chars
ans = S.zip(T).count { |(s, t)| s == t }
puts ans
