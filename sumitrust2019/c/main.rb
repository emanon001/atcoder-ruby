X = gets.to_i
n = X / 100
m = X % 100
if m <= n * 5
  puts '1'
else
  puts '0'
end
