N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

dp = Array.new(K + 1, false)
(0..K).each do |k|
  A.each do |a|
    if k - a >= 0
      dp[k] ||= !dp[k - a]
    end
  end
end
puts(dp[K] ? 'First' : 'Second')