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
MOD = 10 ** 9 + 7
blue = K
red = N - K
comb = ModComb.new(10 ** 5, MOD)
(1..K).each do |k|
  box = k
  puts comb.comb(blue - 1, box - 1) * comb.comb(red + 1, box) % MOD
end
