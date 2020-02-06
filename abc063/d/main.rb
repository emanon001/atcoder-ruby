N, A, B = gets.split.map(&:to_i)
H = N.times.map { gets.to_i }

def ok?(count)
  b_damage = B * count
  diff = A - B
  rest_count = count
  H.each do |h|
    rest_h = h - b_damage
    next if rest_h <= 0
    c = (rest_h + diff - 1) / diff
    if c > rest_count
      return false
    end
    rest_count -= c
  end
  true
end

left = 1
right = H.max
ans = 1 << 60
while left <= right
  mid = (left + right) / 2
  if ok?(mid)
    right = mid - 1
    ans = mid if mid < ans
  else
    left = mid + 1
  end
end
puts ans