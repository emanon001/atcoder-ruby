A1, A2, A3 = gets.split.map(&:to_i)
if A1 + A2 + A3 >= 22
  puts 'bust'
else
  puts 'win'
end
