n, m, q = gets.not_nil!.split.map(&.to_i)
lrs = m.times.map { gets.not_nil!.split.map(&.to_i) }
pqs = q.times.map { gets.not_nil!.split.map(&.to_i) }
count_list = Array.new(n) { Array.new(n, 0) }
lrs.each do |(l, r)|
  l -= 1
  r -= 1
  count_list[l][r] += 1
end
sum_list = Array.new(n) { Array.new(n, 0) }
count_list.each.with_index do |row, i|
  sum = 0
  row.each.with_index do |c, j|
    sum += c
    sum_list[i][j] = sum
  end
end
pqs.each do |(p, q)|
  p -= 1
  q -= 1
  sum = 0
  (p..q).each do |i|
    sum += if i > 0
      sum_list[i][q] - sum_list[i][i - 1]
    else
      sum_list[i][q]
    end
  end
  puts sum
end
