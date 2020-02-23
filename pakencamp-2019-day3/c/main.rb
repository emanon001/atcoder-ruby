N, M = gets.split.map(&:to_i)
A = N.times.map { gets.split.map(&:to_i) }

ans = 0
(0...M).to_a.combination(2).each do |a, b|
  sum = 0
  N.times do |i|
    p1 = A[i][a]
    p2 = A[i][b]
    sum += (p1 > p2 ? p1 : p2)
  end
  ans = sum if sum > ans
end
puts ans