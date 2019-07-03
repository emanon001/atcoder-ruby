num_list = gets.split.map(&:to_i)
ans = num_list.combination(3).map { |a, b, c| a + b + c }.sort[-3]
puts ans
