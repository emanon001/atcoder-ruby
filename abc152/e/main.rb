N = gets.to_i
MOD = 10 ** 9 + 7
as = gets.split.map(&:to_i)
lcm = as.reduce(1) do |acc, a|
  acc.lcm(a)
end
ans = 0
as.each do |a|
  ans = (ans + (lcm / a) % MOD) % MOD
end
puts ans