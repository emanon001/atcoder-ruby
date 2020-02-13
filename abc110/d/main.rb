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

require 'prime'
N, M = gets.split.map(&:to_i)

if M == 1
  puts 1
  exit 0
end

MOD = 10 ** 9 + 7
prime_division = M.prime_division
max_k = prime_division.max_by { |_, e| e }[1]
comb = ModComb.new(N + max_k, MOD)
ans = 1
prime_division.each do |n, e|
  ans = (ans * comb.comb(N + e - 1, e)) % MOD
end
puts ans