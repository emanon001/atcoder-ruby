N = gets.to_i
S = gets.chomp

puts S.gsub('ABC', '*').chars.count('*')