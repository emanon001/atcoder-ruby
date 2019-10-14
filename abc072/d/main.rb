N = gets.to_i
ps = gets.split.map(&:to_i)

ans = 0
same_count = 0
(ps + [-1]).each.with_index do |n, i|
  i += 1
  if n == i
    same_count += 1
  else
    m = same_count / 2
    ans += (same_count.even? ? m : m + 1)
    same_count = 0
  end
end
puts ans
