N, K = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)

sum = a_list[0, K].reduce(&:+)
ans = sum
(K..(N - 1)).each do |i|
  a = a_list[i]
  head = a_list[i - K]
  sum = sum - head + a
  ans += sum
end
puts ans
