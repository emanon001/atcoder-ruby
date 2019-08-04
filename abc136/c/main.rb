N = gets.to_i
h_list = gets.split.map(&:to_i)
max = 0
is_ok = h_list.all? do |h|
  next false if max > h
  max = max == h ? max : h - 1
  true
end
puts(is_ok ? 'Yes' : 'No')
