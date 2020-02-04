N, D, A = gets.split.map(&:to_i)
XH = N.times.map { gets.split.map(&:to_i) }

sorted = XH.sort_by { |x, _| x }
sub_count = Array.new(N, 0)
count = 0
ans = 0
N.times do |i|
  x, h = sorted[i]
  count -= sub_count[i]
  sum = count * A
  rest = h - sum
  next if rest <= 0
  add_count = (rest + A - 1) / A
  count += add_count
  j = sorted.bsearch_index do |y, _|
    y > x + 2 * D 
  end
  sub_count[j] += add_count if j
  ans += add_count
end
puts ans