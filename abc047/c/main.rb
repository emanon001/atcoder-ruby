S = gets.chomp.chars
ans = 0
current = S[0]
S.drop(1).each do |ch|
  if current != ch
    ans += 1
  end
  current = ch
end
puts ans
