class Bit
  def initialize(n)
    @bit = Array.new(n + 1, 0)
    @n = n
  end

  def add(i, x)
    while i <= @n
      @bit[i] += x
      i += i & -i
    end
  end

  def sum(i)
    s = 0
    while i > 0
      s += @bit[i]
      i -= i & -i
    end
    s
  end
end
