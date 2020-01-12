s = gets.chomp.chars
t = gets.chomp.chars

if s == t
  puts 'No'
  exit 0
end

sorted_s = s.sort
sorted_t = t.sort.reverse
is_ok = [sorted_s, sorted_t].sort[0] == sorted_s
puts(is_ok ? 'Yes' : 'No')