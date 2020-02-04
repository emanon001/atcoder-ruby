class ModComb
  def initialize(max, mod)
    @mod = mod
    @fac = Array.new(max + 1)
    @finv = Array.new(max + 1)
    @inv = Array.new(max + 1)
    @fac[0] = @fac[1] = 1
    @finv[0] = @finv[1] = 1
    @inv[1] = 1
    (2..max).each do |i|
      @fac[i] = @fac[i - 1] * i % @mod
      @inv[i] = @mod - @inv[@mod % i] * (@mod / i) % @mod
      @finv[i] = @finv[i - 1] * @inv[i] % @mod
    end
  end

  def comb(n, k)
    return 0 if n < k
    return 0 if n < 0 || k < 0
    @fac[n] * (@finv[k] * @finv[n - k] % @mod) % @mod
  end
end

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

MOD = 10 ** 9 + 7
sorted = A.sort
comb = ModComb.new(N, MOD)
ans = 0
N.times do |i|
  a = sorted[i]
  max_count = comb.comb(i, K - 1)
  min_count = comb.comb(N - i - 1, K - 1)
  ans = (ans + (a * max_count % MOD) - (a * min_count % MOD)) % MOD
end
puts ans