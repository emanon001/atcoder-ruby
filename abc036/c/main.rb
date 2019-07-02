N = gets.to_i
a_list = N.times.map.with_index { |i| [gets.to_i, i] }
sorted = a_list.sort_by { |a, _| a }
b_list = Array.new(N)
max = -1
current = nil
sorted.each do |(a, i)|
  if a != current
    current = a
    max += 1
  end
  b_list[i] = max
end
b_list.each { |b| puts b }
