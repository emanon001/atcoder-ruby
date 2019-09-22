class Bit
  def initialize(n)
    @bit = Array.new(n + 1, 0)
    @n = n
  end

  # 0-origin
  def add(i, x)
    i += 1
    while i <= @n
      @bit[i] += x
      i += i & -i
    end
  end

  # 0-origin
  def sum(i)
    i += 1
    s = 0
    while i > 0
      s += @bit[i]
      i -= i & -i
    end
    s
  end
end
