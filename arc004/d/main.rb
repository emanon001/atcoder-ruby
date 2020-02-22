class ModInt
  MOD = 10 ** 9 + 7

  attr_reader :n

  def initialize(n)
    @n = n % MOD
  end

  def +(other)
    if other.is_a?(ModInt)
      ModInt.new(@n + other.n)
    else
      ModInt.new(@n + other)
    end
  end

  def -(other)
    if other.is_a?(ModInt)
      ModInt.new(@n - other.n)
    else
      ModInt.new(@n - other)
    end
  end

  def *(other)
    if other.is_a?(ModInt)
      ModInt.new(@n * other.n)
    else
      ModInt.new(@n * other)
    end
  end

  def pow(t)
    return ModInt.new(1) if t == 0
    a = pow(t >> 1)
    a = a * a
    if t[0] == 1
      a = a * self
    end
    a
  end

  def inv
    pow(MOD - 2)
  end

  def /(other)
    if other.is_a?(ModInt)
      self * other.inv
    else
      self * ModInt.new(other).inv
    end
  end
end

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

N, M = gets.split.map(&:to_i)

require 'prime'
prime_division = N.abs.prime_division
MOD = 10 ** 9 + 7
comb = ModComb.new(10 ** 5 + 100, MOD)
ans = ModInt.new(1)
prime_division.each do |n, k|
  ans *= comb.comb(M + k - 1, k)
end
m = N > 0 ? ModInt.new(1) : ModInt.new(0)
k = N > 0 ? 2 : 1
while k <= M
  m += comb.comb(M, k)
  k += 2
end
puts (ans * m).n