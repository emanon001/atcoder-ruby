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


N, M, Q = gets.split.map(&:to_i)
lrs = M.times.map { gets.split.map(&:to_i) }
pqs = Q.times.map { gets.split.map(&:to_i) }
list = []
lrs.each do |(l, r)|
  list.push([l - 1, r - 1, -1])
end
pqs.each.with_index do |(p, q), i|
  list.push([p - 1, q - 1, i])
end
sorted = list.sort_by { |(_, b, c)| [b, c] }
bit = Bit.new(N)
ans = Array.new(Q)
sorted.each do |(a, b, c)|
  if c == -1
    bit.add(a, 1)
  else
    sum = bit.sum(b) - bit.sum(a - 1)
    ans[c] = sum
  end
end
ans.each do |sum|
  puts sum
end
