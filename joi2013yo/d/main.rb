D, N = gets.split.map(&:to_i)
T = D.times.map { gets.to_i }
ABC = N.times.map { gets.split.map(&:to_i) }

def max(a, b); a > b ? a : b; end

dp = Array.new(D + 1) { Array.new(N, nil) }
N.times { |i| dp[0][i] = 0 }
D.times do |i|
  t = T[i]
  N.times do |j| # to
    a, b, c = ABC[j]
    next unless t >= a && t <= b
    N.times do |k| # from
      next unless dp[i][k]
      cur_c = dp[i + 1][j] || 0
      new_c = if i == 0
        0
      else
        dp[i][k] + (ABC[k][2] - c).abs
      end
      dp[i + 1][j] = max(cur_c, new_c)
    end
  end
end
ans = 0
dp[D].each do |c|
  next unless c
  ans = c if c > ans
end
puts ans