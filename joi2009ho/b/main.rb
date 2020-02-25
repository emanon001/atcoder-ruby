D = gets.to_i # distance
N = gets.to_i # shop count
M = gets.to_i # order count
SP = (N - 1).times.map { gets.to_i }
OP = M.times.map { gets.to_i }

sorted = [0] + SP.sort + [D]
ans = 0
OP.each do |op|
  # 時計回り
  i = sorted.bsearch_index do |x|
    x > op
  end
  i -= 1
  # 反時計回り
  j = sorted.bsearch_index do |x|
    x >= op
  end

  d1 = op - sorted[i]
  d2 = sorted[j] - op
  d = d1 < d2 ? d1 : d2
  ans += d
end
puts ans