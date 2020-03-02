S = gets.chomp.chars
K = gets.to_i
N = S.size

require 'set'
set = Set.new
N.times do |i|
  next if i + K > N
  set.add(S[i, K])
end
puts set.size