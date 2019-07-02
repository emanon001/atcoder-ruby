N, Q = gets.split.map(&:to_i)
lr_list = Q.times.map { gets.split.map(&:to_i) }

table = Hash.new { 0 }
lr_list.each do |(l, r)|
  table[l] += 1
  table[r + 1] -= 1
end
sum_list = Array.new(N + 10) { 0 }
(1..N).each do |i|
  sum_list[i] = sum_list[i - 1] + table[i]
end
ans = (1..N).map do |i|
  sum_list[i] % 2
end
puts ans.join('')
