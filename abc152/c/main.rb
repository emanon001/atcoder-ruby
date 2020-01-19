N = gets.to_i
P = gets.split.map(&:to_i)

min = 1 << 60
ans = 0
P.each do |n|
  if n <= min
    ans += 1
  end
  min = n if n < min
end
puts ans