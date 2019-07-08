N = gets.to_i
a_list = gets.split.map(&:to_i)

sum = a_list.reduce(&:+)
x1 = sum
1.step(by: 2, to: N - 2) do |i|
  x1 -= a_list[i] * 2
end
ans = Array.new(N)
ans[0] = x1
(0...(N - 1)).each do |i|
  ans[i + 1] = a_list[i] * 2 - ans[i]
end
puts ans.join(' ')
