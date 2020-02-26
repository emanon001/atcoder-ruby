N = gets.to_i
HS = N.times.map { gets.split.map(&:to_i) }

def ok?(n)
  table = Hash.new { 0 }
  HS.each do |h, s|
    return false if h > n
    c = (n - h) / s
    table[c] += 1
  end
  destroyed_count = -1
  table.keys.sort.each do |s|
    c = table[s]
    return false if s - destroyed_count < c
    destroyed_count += c
  end
  true
end

l = 0
r = (10 ** 9) + (10 ** 9) * (10 ** 5) + 1
ans = r
while l < r
  mid = (l + r) / 2
  if ok?(mid)
    r = mid
    ans = mid if mid < ans
  else
    l = mid + 1
  end
end
puts ans