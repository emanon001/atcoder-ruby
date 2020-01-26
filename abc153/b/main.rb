H, N = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
sum = A.reduce(0, &:+)
if sum >= H
  puts 'Yes'
else
  puts 'No'
end