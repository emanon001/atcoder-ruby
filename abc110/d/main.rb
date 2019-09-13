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

require 'prime'
N, M = gets.split.map(&:to_i)
MOD = 10 ** 9 + 7
es = M.prime_division.map { |(n, e)| e }
comb = ModComb.new(10 ** 5 + 100, MOD)
ans = 1
es.each do |e|
  ans = ans * comb.comb(N + e - 1, e) % MOD
end
puts ans
