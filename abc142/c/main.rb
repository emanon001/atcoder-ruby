N = gets.to_i
as = gets.split.map(&:to_i)
sorted = as.map.with_index { |a, i| [a, i + 1] }.sort
puts sorted.map { |_, i| i }.join(' ')
