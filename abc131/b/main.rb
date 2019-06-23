N, L = gets.split.map(&:to_i)
list = (1..N).map { |i| L + i - 1 }
list2 = list.map(&:abs)
sum = list.reduce(&:+)
list3 = list2.map.with_index { |a, i| [a, i] }.sort
i = list3[0][1]
ans = sum - list[i]
puts ans
