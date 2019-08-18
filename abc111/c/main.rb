n = gets.to_i
vs = gets.split.map(&:to_i)
even_table = Hash.new { 0 }
odd_table = Hash.new { 0 }
vs.each.with_index do |v, i|
  if i.even?
    even_table[v] += 1
  else
    odd_table[v] += 1
  end
end
ans = 1 << 60
sorted_even = even_table.sort_by { |_, v| -v }
sorted_odd = odd_table.sort_by { |_, v| -v }
[sorted_even.size, 2].min.times do |i|
  [sorted_odd.size, 2].min.times do |j|
    if sorted_even[i][0] == sorted_odd[j][0]
      count = n - [sorted_even[i][1], sorted_odd[j][1]].max
      ans = count if count < ans
    else
      count = n - (sorted_even[i][1] + sorted_odd[j][1])
      ans = count if count < ans
    end
  end
end
puts ans
