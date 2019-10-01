N = gets.to_i
as = gets.split.map(&:to_i)
ans = 0
repeat_count = 0
prev = -1
as.each do |a|
  if prev == a
    repeat_count += 1
  else
    ans += (repeat_count + 1) / 2
    repeat_count = 0
    prev = a
  end
end
ans += (repeat_count + 1) / 2
puts ans
