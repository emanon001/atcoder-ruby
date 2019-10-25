require 'set'
S = gets.chomp.chars
K = gets.to_i

set = Set.new
(0...(S.size)).each do |i|
  (0...K).each do |j|
    next if i + j >= S.size
    s = S[i..(i + j)].join('')
    set.add(s)
  end
end
ans = set.to_a.sort[K - 1]
puts ans
