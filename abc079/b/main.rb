N = gets.to_i

MEMO = {}
def lucas(n)
  return MEMO[n] if MEMO[n]
  MEMO[n] = if n == 0
    2
  elsif n == 1
    1
  else
    lucas(n - 1) + lucas(n - 2)
  end
end

puts lucas(N)
