N = gets.to_i
a_list = N.times.map { gets.to_i }
list = []
a_list.each do |a|
  i = list.bsearch_index { |b| a > b }
  if i
    list[i] = a
  else
    list.push(a)
  end
end
puts list.size
