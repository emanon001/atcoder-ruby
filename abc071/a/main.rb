x, a, b = gets.split.map(&:to_i)
if (x - a).abs < (x - b).abs
  puts 'A'
else
  puts 'B'
end
