N = gets.to_i
lrs = N.times.map { gets.split.map(&:to_i) }

max_i = -1
max = -1
lrs.each.with_index do |(l, r), i|
  v = r - l + 1
  if v > max
    max_i = i
    max = v
  end
end

lrs.delete_at(max_i)

max_l = nil
min_r = nil
lrs.each do |l, r|
  if max_l.nil?
    max_l = l
    min_r = r
  else
    max_l = l if l > max_l
    min_r = r if r < min_r
  end
end

if max_l.nil?
  puts max
else
  ans = max + (max_l <= min_r ? min_r - max_l + 1 : 0)
  puts ans
end
