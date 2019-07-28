N, K = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
sum_list = Array.new(N)
sum = 0
a_list.each.with_index do |a, i|
  sum += a
  sum_list[i] = sum
end

ans = 0
diff = 0
N.times do |i|
  j = sum_list.bsearch_index do |a|
    a - diff >= K
  end
  ans += N - j if j
  diff += a_list[i]
end
puts ans
