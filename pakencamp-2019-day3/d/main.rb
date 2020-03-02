N = gets.to_i
grid = 5.times.map { gets.chomp.chars }
color_counts = Array.new(N) { Hash.new { 0 } }
N.times do |i| # col
  5.times do |j| # row
    color_counts[i][grid[j][i]] += 1
  end
end

def min(a, b); a < b ? a : b; end

INF = 1 << 60
COLORS = ['R', 'B', 'W']
dp = Array.new(N + 1) { Hash.new { INF } }
COLORS.each { |c| dp[0][c] = 0 }
N.times do |i|
  COLORS.each do |from|
    COLORS.each do |to|
      next if from == to
      c = 5 - color_counts[i][to]
      dp[i + 1][to] = min(dp[i + 1][to], dp[i][from] + c)
    end
  end
end
puts dp[N].values.min