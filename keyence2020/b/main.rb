N = gets.to_i
xls = N.times.map { gets.split.map(&:to_i) }

sorted = xls.sort_by { |(x, l)| x - l }
ans = 0
r = -(1 << 60)
sorted.each do |(x, l)|
  left = x - l
  right = x + l
  if left >= r
    ans += 1
    r = right
  elsif right < r
    r = right
  end
end
puts ans