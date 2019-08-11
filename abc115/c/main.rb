N, K = gets.split.map(&:to_i)
hs = N.times.map { gets.to_i }.sort
ans = 1 << 60
(N - K + 1).times do |i|
  diff = (hs[i] - hs[i + K - 1]).abs
  ans = diff if diff < ans
end
puts ans
