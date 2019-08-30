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

N = gets.to_i

n = (1..N).reduce(:*)
# [3, 5, 5], [15, 5], [3, 25], [75]
es = n.prime_division.map { |_, e| e }
count3 = es.count { |e| e >= 3 - 1 }
count5 = es.count { |e| e >= 5 - 1 }
count15 = es.count { |e| e >= 15 - 1 }
count25 = es.count { |e| e >= 25 - 1 }
count75 = es.count { |e| e >= 75 - 1 }
ans = 0
comb = ModComb.new(1000, 10 ** 9 + 7)
ans += comb.comb(count5, 2) * comb.comb(count3 - 2, 1)
ans += comb.comb(count15, 1) * comb.comb(count5 - 1, 1)
ans += comb.comb(count25, 1) * comb.comb(count3 - 1, 1)
ans += comb.comb(count75, 1)
puts ans
