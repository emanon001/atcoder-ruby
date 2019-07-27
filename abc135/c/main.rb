N = gets.to_i
a_list = gets.split.map(&:to_i)
b_list = gets.split.map(&:to_i)

count = 0
b_list.each.with_index do |b, i|
  n = [b, a_list[i]].min
  b2 = b - n
  a_list[i] -= n
  count += n
  m = [b2, a_list[i + 1]].min
  b3 = b2 - m
  a_list[i + 1] -= m
  count += m
end
puts count
