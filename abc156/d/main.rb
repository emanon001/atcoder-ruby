def mod_pow(a, n, mod)
  ret = 1
  while n > 0
    if n[0] == 1
      ret = ret * a % mod
    end
    a = a * a % mod
    n = n >> 1
  end
  ret
end

def factorial(n, m, mod)
  r = 1
  n.downto(m).each do |a|
    r = (r * a) % mod
  end
  r
end

N, A, B = gets.split.map(&:to_i)
MOD = 10 ** 9 + 7
all = mod_pow(2, N, MOD) - 1
ans = all
a = factorial(N, N - A + 1, MOD)
b = factorial(N, N - B + 1, MOD)
ans = (ans - a - b)
puts ans