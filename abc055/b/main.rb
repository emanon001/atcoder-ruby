N = gets.to_i
ans = 1
MOD = 10 ** 9 + 7
(1..N).each do |n|
  ans = ans * n % MOD
end
puts ans
