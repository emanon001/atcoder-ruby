N = gets.to_i
S = gets.chomp.chars
MOD = 10 ** 9 + 7
table = Hash.new { 0 }

S.each do |ch|
  table[ch] += 1
end

n = 1
table.values.each do |v|
  n = n * (2 + v - 1) % MOD
end
puts n - 1
