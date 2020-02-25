class ModInt
  MOD = 10 ** 9 + 7

  attr_reader :n

  def initialize(n)
    @n = n % MOD
  end

  def +(other)
    on = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n + on)
  end

  def -(other)
    on = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n - on)
  end

  def *(other)
    on = other.is_a?(ModInt) ? other.n : other
    ModInt.new(@n * on)
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
    @n.to_s
  end

  def inspect
    "mi:#{@n}"
  end
end