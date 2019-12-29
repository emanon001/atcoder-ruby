A, B, K = gets.split.map(&:to_i)

a_count = [A - K, 0].max
b_count = if A < K
 [B - (K - A), 0].max
else
  B
end

puts "#{a_count} #{b_count}"