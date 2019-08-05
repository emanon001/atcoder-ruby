N, M = gets.split.map(&:to_i)
ab_list = N.times.map { gets.split.map(&:to_i) }.sort_by { |(a, b)| a }
yen = 0
rest = M
ab_list.each do |(a, b)|
  c = [b, rest].min
  yen += a * c
  rest -= c
  break if rest == 0
end
puts yen
