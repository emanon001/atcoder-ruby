N = gets.to_i

require 'prime'
dict = Hash.new { 0 }
(2..N).each do |a|
  a.prime_division.each do |n, e|
    dict[n] += e
  end
end
MOD = 10 ** 9 + 7
ans = 1
dict.each do |_, c|
  ans = (ans * (c + 1)) % MOD
end
puts ans