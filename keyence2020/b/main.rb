N = gets.to_i
XL = N.times.map { gets.split.map(&:to_i) }

sorted = XL.sort_by { |x, l| x - l }
ans = 0
current_right = -(1 << 60)
sorted.each do |x, l|
  left = x - l
  right = x + l
  if left >= current_right
    ans += 1
    current_right = right
  elsif right < current_right
    current_right = right
  end
end
puts ans