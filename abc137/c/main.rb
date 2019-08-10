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

N = gets.to_i
table = Hash.new { 0 }
s_list = N.times.map { gets.chomp.chars }
s_list.each do |s|
  table[s.sort] += 1
end

ans = 0
comb = ModComb.new(N, 67280421310721)
table.each do |k, v|
  next if v == 0
  ans += comb.comb(v, 2)
end
puts ans
