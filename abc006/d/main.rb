N = gets.to_i
C = N.times.map { gets.to_i }
INF = 1 << 60
dp = Array.new(N + 1, INF)
dp[0] = 0
C.each do |c|
  i = dp.bsearch_index do |n|
    n > c
  end
  dp[i] = c
end
size = 0
dp.each.with_index do |c, i|
  size = i if c < INF
end
puts N - size