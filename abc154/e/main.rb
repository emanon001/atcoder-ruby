N = gets.chomp.chars.map(&:to_i)
K = gets.to_i

DIGITS = N.size
dp = Array.new(DIGITS + 1) { Array.new(2) { Array.new(K + 2, 0) } }
dp[0][0][0] = 1
DIGITS.times do |i|
  d = N[i]
  # same
  if d == 0
    (0..K).each do |k|
      dp[i + 1][0][k] = dp[i][0][k]
    end
  else
    (0..K).each do |k|
      c = 0
      (0..i).each do |ii|
        c += 1 if N[ii] != 0
      end
      dp[i + 1][0][c] = 1
    end
  end
  # lower
  (0..9).each do |n|
    (0..K).each do |k|
      if n == 0
        dp[i + 1][1][k] += dp[i][1][k]
      else
        dp[i + 1][1][k + 1] += dp[i][1][k]
      end
    end
  end
  # same -> lower
  (0..d).each do |n|
    next if n == d
    (0..K).each do |k|
      if n == 0
        dp[i + 1][1][k] += dp[i][0][k]
      else
        dp[i + 1][1][k + 1] += dp[i][0][k]
      end
    end
  end
end

ans = dp[DIGITS][0][K] + dp[DIGITS][1][K]
puts ans