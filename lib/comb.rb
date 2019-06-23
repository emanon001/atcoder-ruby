def comb_init(max, mod)
  fac = Array.new(max)
  finv = Array.new(max)
  inv = Array.new(max)
  fac[0] = fac[1] = 1
  finv[0] = finv[1] = 1
  inv[1] = 1
  (2...max).each do |i|
    fac[i] = fac[i - 1] * i % mod
    inv[i] = mod - inv[mod % i] * (mod / i) % mod
    finv[i] = finv[i - 1] * inv[i] % mod
  end
  { fac: fac, finv: finv, mod: mod }
end

def comb(n, k, context)
  return 0 if n < k
  return 0 if n < 0 || k < 0
  fac = context[:fac]
  finv = context[:finv]
  mod = context[:mod]
  fac[n] * (finv[k] * finv[n - k] % mod) % mod
end
