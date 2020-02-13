N, M = gets.split.map(&:to_i)
ABCW = N.times.map { gets.split.map(&:to_i) }
XYZ = M.times.map { gets.split.map(&:to_i) }

MAX_P = 100
dp = Array.new(MAX_P + 1) { Array.new(MAX_P + 1) { Array.new(MAX_P + 1, 0) } }
ABCW.each do |a, b, c, w|
  dp[a][b][c] = w
end

def max(a, b, c, d)
  r = a > b ? a : b
  r = r > c ? r : c
  r = r > d ? r : d
end

(1..MAX_P).each do |i|
  (1..MAX_P).each do |j|
    (1..MAX_P).each do |k|
      r1 = dp[i][j][k]
      r2 = dp[i - 1][j][k]
      r3 = dp[i][j - 1][k]
      r4 = dp[i][j][k - 1]
      dp[i][j][k] = max(r1, r2, r3, r4)
    end
  end
end
XYZ.each do |x, y, z|
  puts dp[x][y][z]
end