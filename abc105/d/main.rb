N, M = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)

sum = 0
sum_list = Array.new(N)
as.each.with_index do |a, i|
  sum += a
  sum_list[i] = sum
end

mod_table = Hash.new { 0 }
sum_list.each { |s| mod_table[s % M] += 1 }

ans = 0
sum = 0
as.each do |a|
  n = sum % M
  ans += mod_table[n]
  sum += a
  mod_table[sum % M] -= 1
end
puts ans
