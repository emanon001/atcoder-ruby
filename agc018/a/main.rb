N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

max = A.max
if K > max
  puts 'IMPOSSIBLE'
  exit 0
end

gcd = A.reduce { |acc, a| acc.gcd(a) }
puts(K % gcd == 0 ? 'POSSIBLE' : 'IMPOSSIBLE')