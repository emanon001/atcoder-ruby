N = gets.to_i
A = N.times.map { gets.to_i }

def max(a, b); a > b ? a : b; end

def solve(i, j, joi, dp)
  return dp[i][j] if dp[i][j]
  if i == j
    return joi ? dp[i][j] = A[i] : 0
  end
  dp[i][j] = if joi
    x = A[i] + solve(i == 0 ? N - 1 : i - 1, j, false, dp)
    y = A[j] + solve(i, j == N - 1 ? 0 : j + 1, false, dp)
    max(y, x)
  else
    if A[i] > A[j]
      solve(i == 0 ? N - 1 : i - 1, j, true, dp)
    else
      solve(i, j == N - 1 ? 0 : j + 1, true, dp)
    end
  end
end

dp = Array.new(N) { Array.new(N) }
ans = 0
N.times do |i|
  ans = max(ans, solve(i, i == N - 1 ? 0 : i + 1, true, dp))
end
puts ans