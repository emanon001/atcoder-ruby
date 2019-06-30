S = gets.chomp.chars
t = Hash.new { 0 }
S.each do |ch|
  t[ch] += 1
end
is_ok = t.keys.size == 2 && t.values.all? { |c| c == 2 }
puts(is_ok ? 'Yes' : 'No')
