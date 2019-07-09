s = gets.chomp.chars
t = gets.chomp.chars
dp = Array.new(s.size + 1)
dp.size.times do |i|
  dp[i] = Array.new(t.size + 1, 0)
end
s.size.times do |i|
  t.size.times do |j|
    dp[i + 1][j + 1] =
      if s[i] == t[j]
        dp[i][j] + 1
      else
        a = dp[i][j + 1]
        b = dp[i + 1][j]
        a > b ? a : b
      end
  end
end
ans = ''
i = s.size; j = t.size
while i > 0 && j > 0
  if dp[i][j] == dp[i - 1][j]
    i -= 1
  elsif dp[i][j] == dp[i][j - 1]
    j -= 1
  else
    ans = s[i - 1] + ans
    i -= 1
    j -= 1
  end
end
puts ans
