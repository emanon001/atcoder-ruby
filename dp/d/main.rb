N, W = gets.split.map(&:to_i)
wvs = N.times.map { gets.split.map(&:to_i) }
dp = Array.new(N + 1) { Array.new(W + 1, 0) }

N.times do |i|
  w, v = wvs[i]
  (0..W).each do |j|
    base_v = dp[i][j]
    next if j != 0 && base_v == 0
    current_v = dp[i + 1][j]
    new_v = base_v
    dp[i + 1][j] = new_v > current_v ? new_v : current_v
    if j + w <= W
      current_v = dp[i + 1][j + w]
      from_v = dp[i][j]
      new_v = from_v + v
      dp[i + 1][j + w] = new_v > current_v ? new_v : current_v
    end
  end
end
ans = dp[N].max
puts ans