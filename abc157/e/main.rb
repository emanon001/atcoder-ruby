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

N = gets.to_i
S = gets.chomp.chars.map { |ch| ch.ord - 97 }
bits = Array.new(26) { Bit.new(N) }
S.each.with_index do |o, i|
  bits[o].add(i, 1)
end
Q = gets.to_i
Q.times do
  k, a, b = gets.chomp.split
  a = a.to_i - 1
  k = k.to_i
  if k == 1
    b = b.ord - 97
    next if S[a] == b
    prev = S[a]
    S[a] = b
    bits[prev].add(a, -1)
    bits[b].add(a, 1)
  else
    b = b.to_i - 1
    ans = 0
    26.times do |i|
      ans += 1 if bits[i].sum(b) - (a == 0 ? 0 : bits[i].sum(a - 1)) > 0
    end
    puts ans
  end
end