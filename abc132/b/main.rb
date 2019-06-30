N = gets.to_i
p_list = gets.split.map(&:to_i)
count = 0
(1..(N - 2)).each do |i|
  a = p_list[i - 1]
  b = p_list[i]
  c = p_list[i + 1]
  count += 1 if [a, b, c].sort[1] == b
end
puts count
