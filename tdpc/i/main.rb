S = gets.chomp.chars
N = S.size

def iwi(l, r, dp)
  return dp[l][r] if dp[l][r]
  return dp[l][r] = 0 if r - l <= 2
  ret = 0
  ((l + 1)...r).each do |m|
    a = iwi(l, m, dp) + iwi(m, r, dp)
    ret = a if a > ret
  end
  if S[l] == 'i' && S[r - 1] == 'i'
    ((l + 1)...r).each do |m|
      next if S[m] != 'w'
      a = iwi(l + 1, m, dp)
      b = iwi(m + 1, r - 1, dp)
      if a == m - l - 1 && b == r - m - 2
        ret = r - l
        break
      end
    end
  end
  dp[l][r] = ret
end
dp = Array.new(N + 1) { Array.new(N + 1) }
ans = iwi(0, N, dp) / 3
puts ans