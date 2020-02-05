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

X, Y = gets.split.map(&:to_i)

if (X + Y) % 3 != 0
  puts 0
  exit 0
end

diff = (X - Y).abs
min = [X, Y].min

if diff > min
  puts 0
  exit 0
end

MOD = 10 ** 9 + 7
count1 = (min - diff) / 3
count2 = (min - diff) / 3 + diff
count = count1 + count2
comb = ModComb.new(count, MOD)
ans = comb.comb(count, count1)
puts ans