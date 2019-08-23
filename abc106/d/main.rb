N, M, Q = gets.split.map(&:to_i)
lrs = M.times.map { gets.split.map(&:to_i) }
pqs = Q.times.map { gets.split.map(&:to_i) }
count_list = Array.new(N) { Array.new(N){ 0 } }
lrs.each do |(l, r)|
  l -= 1
  r -= 1
  count_list[l][r] += 1
end
sum_list = Array.new(N) { Array.new(N){ 0 } }
N.times do |i|
  sum = 0
  N.times do |j|
    sum += count_list[i][j]
    sum_list[i][j] = sum
  end
end
N.times do |i|
  sum = 0
  N.times do |j|
    sum += sum_list[j][i]
    sum_list[j][i] = sum
  end
end
pqs.each do |(p, q)|
  p -= 1
  q -= 1
  ans = sum_list[q][q] - (p > 0 ? sum_list[p - 1][q] : 0)
  puts ans
end
