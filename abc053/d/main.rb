N = gets.to_i
as = gets.split.map(&:to_i)
unique_as = as.uniq

dup_count = N - unique_as.size
ans = N - ((dup_count + 1) / 2) * 2
puts ans
