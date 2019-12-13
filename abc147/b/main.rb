S = gets.chomp.chars
size = S.size
ans = (0...(size / 2)).count do |i|
  S[i] != S[-(i + 1)]
end
puts ans
