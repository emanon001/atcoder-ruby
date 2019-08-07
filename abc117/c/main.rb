N, M = gets.split.map(&:to_i)
x_list = gets.split.map(&:to_i)
sorted = x_list.sort
diff_list = sorted.each_cons(2).map do |(a, b)|
  b - a
end
ans = diff_list.sort_by { |n| -n }.drop(N - 1).reduce(0, &:+)
puts ans
