A = gets.chomp.chars

if A.size == 1
  ch = A[0]
  puts(ch == 'a' ? '-1' : (ch.ord - 1).chr)
else
  puts A[0..-2].join('')
end