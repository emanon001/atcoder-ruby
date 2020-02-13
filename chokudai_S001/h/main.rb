N = gets.to_i
A = gets.split.map(&:to_i)

INF = 1 << 60
dp = Array.new(N, INF)
A.each do |a|
  i = dp.bsearch_index do |b|
    b > a
  end
  dp[i] = a
end
puts dp.count { |n| n != INF }