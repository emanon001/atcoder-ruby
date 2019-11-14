N = gets.to_i
as = gets.split.map(&:to_i)

ans = 1 << 60
(-100..100).each do |n|
  sum = 0
  as.each do |a|
    sum += (a - n) ** 2
  end
  ans = sum if sum < ans
end
puts ans
