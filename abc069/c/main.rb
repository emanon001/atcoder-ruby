N = gets.to_i
as = gets.split.map(&:to_i)

two_count = 0
four_count = 0
as.each do |a|
  if a % 4 == 0
    four_count += 1
  elsif a % 2 == 0
    two_count += 1
  end
end
n = two_count
m = if two_count > 0
  four_count * 2
else
  four_count > 0 ? four_count * 2 + 1 : 0
end
puts(n + m >= N ? 'Yes' : 'No')
