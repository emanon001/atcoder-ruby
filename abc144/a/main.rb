A, B = gets.split.map(&:to_i)
if A <= 9 && B <= 9
  puts A * B
else
  puts '-1'
end
