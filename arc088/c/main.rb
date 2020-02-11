X, Y = gets.split.map(&:to_i)

ans = 0
n = X
while n <= Y
  ans += 1
  n *= 2
end
puts ans