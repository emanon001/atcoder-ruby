S = gets.chomp.chars
prev = S[0]
is_ok = true
S[1..3].each do |ch|
  if prev == ch
    is_ok = false
  end
  prev = ch
end
puts(is_ok ? 'Good' : 'Bad')
