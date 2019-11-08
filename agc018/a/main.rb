N, K = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)
max = as.max
if max < K
  puts 'IMPOSSIBLE'
  exit 0
end

if as.include?(K)
  puts 'POSSIBLE'
  exit 0
end

n = as.reduce do |acc, a|
  acc.gcd(a)
end
puts(K % n == 0 ? 'POSSIBLE' : 'IMPOSSIBLE')
