require 'set'
S = gets.chomp.chars
K = gets.to_i

set = Set.new
(0...(S.size)).each do |i|
  (i...([i + K, S.size].min)).each do |j|
    set.add(S[i..j].join(''))
  end
end
puts set.to_a.sort[K - 1]
