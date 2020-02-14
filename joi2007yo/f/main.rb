A, B = gets.split.map(&:to_i)
N = gets.to_i
YX = N.times.map do
  x, y = gets.split.map(&:to_i)
  [y - 1, x - 1]
end

require 'set'
ng = Set.new(YX)
if ng.include?([0, 0])
  puts 0
  exit 0
end

dp = Array.new(B) { Array.new(A, 0) }
dp[0][0] = 1
B.times do |i|
  A.times do |j|
    next if ng.include?([i, j])
    if i + 1 < B && !ng.include?([i + 1, j])
      dp[i + 1][j] += dp[i][j]
    end
    if j + 1 < A && !ng.include?([i, j + 1])
      dp[i][j + 1] += dp[i][j]
    end
  end
end
puts dp[B - 1][A - 1]