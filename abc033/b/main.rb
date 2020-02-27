N = gets.to_i
SP = N.times.map do
  s, p = gets.chomp.split
  [s, p.to_i]
end

sum = SP.reduce(0) { |acc, (s, p)| acc + p }
city = SP.find do |s, p|
  p > sum / 2
end
if city
  puts city[0]
else
  puts 'atcoder'
end