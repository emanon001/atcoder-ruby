N, P = gets.split.map(&:to_i)
S = gets.chomp.chars.map(&:to_i)
dp = Hash.new { 0 }
cur = 0
S.each do |n|
  cur = (cur * 10 + n) % P
  dp[cur] += 1
end
ans = 0
m = 0
S.each do |n|
  m = (m * 10 + n) % P
  a = n % P
  b = m
  c = a >= b ? a - b : P + (a - b)
  ans += dp[c]
  dp[b] -= 1
end
puts ans