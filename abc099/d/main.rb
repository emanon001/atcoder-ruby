N, C = gets.split.map(&:to_i)
dboard = C.times.map { gets.split.map(&:to_i) }
board = N.times.map { gets.split.map(&:to_i) }
group = {}
(0...N).each do |i|
  (0...N).each do |j|
    c = board[i][j] - 1
    n = (i + 1 + j + 1) % 3
    group[n] ||= []
    group[n].push(c)
  end
end
group_sums = {}
group.each do |g, l|
  sums = []
  (0...C).each do |c|
    sum = 0
    l.each do |prev_c|
      sum += dboard[prev_c][c]
    end
    sums.push([c, sum])
  end
  sorted = sums.sort_by { |(_, sum)| sum }
  group_sums[g] = sorted
end
ans = 1 << 60
(group_sums[0] || [[-1, 0]]).take(3).each do |(zero_c, zero_sum)|
  (group_sums[1] || [[-2, 0]]).take(3).each do |(one_c, one_sum)|
    next if zero_c == one_c
    (group_sums[2] || [[-3, 0]]).take(3).each do |(two_c, two_sum)|
      next if zero_c == two_c || one_c == two_c
      sum = zero_sum + one_sum + two_sum
      ans = sum if sum < ans
    end
  end
end
puts ans
