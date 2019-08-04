A, B, C = gets.split.map(&:to_i)
rest = A - B
if rest >= C
  puts '0'
else
  puts(C - rest)
end
