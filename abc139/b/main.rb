A, B = gets.split.map(&:to_i)
if B == 1
  puts 0
  exit 0
end
ans = 1
count = A
while count < B
  ans += 1
  count += (A - 1)
end
puts ans
