class ModInt
  MOD = 10 ** 9 + 7

  attr_reader :n

  def initialize(n)
    @n = n % MOD
  end

  def +(other)
    m = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n + m)
  end

  def -(other)
    m = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n - m)
  end

  def *(other)
    m = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n * m)
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
    oinv = other.is_a?(ModInt) ? other.inv : ModInt.new(other).inv
    self * oinv
  end

  def to_s
    inspect
  end

  def inspect
    "mi:#{@n}"
  end
end