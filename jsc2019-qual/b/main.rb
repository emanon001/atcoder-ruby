N, K = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)
MOD = 10 ** 9 + 7

def mod_pow(x, n, mod)
  return 1 if n == 0
  res = mod_pow(x * x % mod, n / 2, mod)
  if n[0] == 1
    res = res * x % mod
  end
  res
end

count1 = 0
(0...N).each do |i|
  n = as[i]
  (0...N).each do |j|
    count1 += 1 if n > as[j]
  end
end
count1 = count1 % MOD
count1 = (count1 * (K * (K - 1) / 2 % MOD)) % MOD if K > 1

count2 = 0
(0...N).each do |i|
  n = as[i]
  ((i + 1)...N).each do |j|
    count2 += 1 if n > as[j]
  end
end

ans = (count1 + (count2 * K % MOD)) % MOD
puts ans
