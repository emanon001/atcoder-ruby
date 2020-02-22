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