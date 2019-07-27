N, K = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
sorted = a_list.map.with_index { |a, i| [a, i] }.sort_by { |(a, _)| -a }
ans = sorted.find { |(a, _)| a < K }
puts(ans ? ans[1] + 1 : -1)
