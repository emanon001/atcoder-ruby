N, K = gets.split.map(&:to_i)
xs = gets.split.map(&:to_i)
ans = 1 << 60
(N - K + 1).times do |i|
  l = xs[i]
  r = xs[i + K - 1]
  n = if l < 0 && r < 0
    l.abs
  elsif l < 0 && r >= 0
    [l.abs, r].min * 2 + [l.abs, r].max
  else
    r
  end
  ans = n if n < ans
end
puts ans
