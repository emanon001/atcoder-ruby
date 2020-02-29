N, K = gets.split.map(&:to_i)
AB = K.times.map { gets.split.map(&:to_i) }.to_h

dp = Array.new(N + 1) { Array.new(4) { Array.new(4, 0) } }
dp[0][0][0] = 1
N.times do |i|
  b = AB[i + 1]
  to = b ? [b] : [1, 2, 3]
  (0..3).each do |x|
    (0..3).each do |y|
      to.each do |z|
        dp[i + 1][z][x] += dp[i][x][y] if z != x || z != y
      end
    end
  end
end
ans = 0
(1..3).each do |i|
  (1..3).each do |j|
    ans += dp[N][i][j]
  end
end
puts ans % 10000