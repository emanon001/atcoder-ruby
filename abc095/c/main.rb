A, B, C, X, Y = gets.split.map(&:to_i)

ans = 1 << 60
(0..([X, Y].max * 2)).each do |c|
  sum = c * C
  sum += A * ([X - c / 2, 0].max)
  sum += B * ([Y - c / 2, 0].max)
  ans = sum if sum < ans
end
puts ans