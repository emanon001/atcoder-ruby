N = gets.to_i
as = gets.split.map(&:to_i)
table = Hash.new { 0 }
as.each do |a|
  table[a] += 1
end
ans = 0
table.each do |a, c|
  ans += if a > c
    c
  else
    c - a
  end
end
puts ans