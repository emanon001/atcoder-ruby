require 'prime'
N = gets.to_i

MOD = 10 ** 9 + 7
table = Hash.new { 0 }
(1..N).each do |n|
  n.prime_division.each do |a, e|
    table[a] += e
  end
end
ans = table.values.reduce(1) do |acc, n|
  acc * (n + 1) % MOD
end
puts ans
