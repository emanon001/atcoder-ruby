N = gets.to_i
hs = gets.split.map(&:to_i)
ans = 0
count = 0
current = 1 << 60
(hs + [1 << 60]).each do |h|
  if current >= h
    count += 1
  else
    ans = count if count > ans
    count = 1
  end
  current = h
end
puts([ans - 1, 0].max)
