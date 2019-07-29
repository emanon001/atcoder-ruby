N, M = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
bc_list = M.times.map { gets.split.map(&:to_i) }

a_to_count = Hash.new { 0 }
a_list.each do |a|
  a_to_count[a] += 1
end
bc_list.each do |(b, c)|
  a_to_count[c] += b
end
sorted = a_to_count.sort_by { |k, _| -k }
sum = 0
rest = N
sorted.each do |(a, c)|
  c = [rest, c].min
  sum += a * c
  rest -= c
  break if rest == 0
end
puts sum
