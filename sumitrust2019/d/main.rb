require 'set'

N = gets.to_i
S = gets.chomp.chars.map(&:to_i)
idx = Hash.new
S.each.with_index do |n, i|
  idx[n] ||= []
  idx[n].push(i)
end

ans = 0
(0..999).each do |n|
  n1, n2, n3 = n.to_s.rjust(3, '0').chars.map(&:to_i)
  idx1 = idx[n1]
  next unless idx1
  i1 = idx1[0]
  idx2 = idx[n2]
  next unless idx2
  i2 = idx2.bsearch { |i2| i2 > i1 }
  next unless i2
  idx3 = idx[n3]
  next unless idx3
  i3 = idx3.bsearch { |i3| i3 > i2 }
  next unless i3
  ans += 1
end
puts ans
