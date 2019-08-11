N = gets.to_i
hs = gets.split.map(&:to_i) + [0]
ans = 0
height = 0
while true
  count = 0
  updated = false
  hs.each do |h|
    if height + 1 <= h
      updated = true
      count += 1
    else
      ans += count > 0 ? 1 : 0
      count = 0
    end
  end
  break unless updated
  height += 1
end
puts ans
