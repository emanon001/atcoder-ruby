S = gets.chomp.chars

def iwi(s, dp)
  return dp[s] if dp[s]
  return dp[s] = 0 if s.size < 3
  ret = 0
  (0..(s.size - 3)).each do |i|
    a = s[i]
    b = s[i + 1]
    c = s[i + 2]
    if a == 'i' && b == 'w' && c == 'i'
      new_s = s.take(i) + s.drop(i + 3)
      r = iwi(new_s, dp) + 1
      ret = r if r > ret
    end
    a = b
    b = c
  end
  dp[s] = ret
end
dp = {}
iwi(S, dp)
puts dp[S]