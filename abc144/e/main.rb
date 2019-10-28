N, K = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)
fs = gets.split.map(&:to_i)

sorted_as = as.sort
sorted_fs = fs.sort_by { |n| -n }
zipped = sorted_as.zip(sorted_fs).to_a

def is_ok(zipped, k, n)
  rest = K
  zipped.each do |(a, f)|
    x = a * f
    next if x <= n
    count = (x - n + f - 1) / f
    return false if count > rest
    rest -= count
  end
  return true
end

l = 0
r = 10 ** 12
ans = -1
while l <= r
  mid = (l + r) / 2
  if is_ok(zipped, K, mid)
    ans = mid
    r = mid - 1
  else
    l = mid + 1
  end
end
puts ans
