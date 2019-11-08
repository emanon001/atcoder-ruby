N = gets.to_i
as = gets.split.map(&:to_i)
sums = Array.new(N)
sum_table = {}
sum = 0
as.each.with_index do |a, i|
  sum += a
  sums[i] = sum
  sum_table[sum] ||= []
  sum_table[sum].push(i)
end

ans = 0
prev_sum = 0
sums.each.with_index do |sum, i|
  indexes = sum_table[prev_sum]
  prev_sum = sum
  next unless indexes
  j = indexes.bsearch_index do |j|
    i <= j
  end
  next unless j
  ans += indexes.size - j
end
puts ans
