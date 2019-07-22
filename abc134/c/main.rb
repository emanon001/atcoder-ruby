N = gets.to_i
a_list = N.times.map { gets.to_i }
sorted = a_list.sort_by { |a| -a }
a_list.each.with_index do |(a, i)|
  if sorted[0] == a
    puts sorted[1]
  else
    puts sorted[0]
  end
end
