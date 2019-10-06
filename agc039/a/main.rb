require 'set'
S = gets.chomp.chars
K = gets.to_i

if Set.new(S).size == 1
  puts S.size * K / 2
  exit 0
end

count = 0
prev = '*'
S.each.with_index do |ch, i|
  if prev == ch
    prev = '*'
    count += 1
  else
    prev = ch
  end
end
prefix_count = S.take_while { |ch| ch == S[0] }.count
suffix_count = S.reverse.take_while { |ch| ch == S[0] }.count
if prefix_count.odd? && suffix_count.odd?
  ans = count * K + (K - 1)
  puts ans
else
  ans = count * K
  puts ans
end
