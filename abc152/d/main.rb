N = gets.to_i

table = Array.new(10) { Array.new(10, 0) }
(1..N).each do |n|
  ns = n.to_s
  head = ns[0].to_i
  tail = ns[-1].to_i
  table[head][tail] += 1
end
ans = 0
(0..9).each do |a|
  (0..9).each do |b|
    ans += table[a][b] * table[b][a]
  end
end
puts ans