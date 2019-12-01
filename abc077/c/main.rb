N = gets.to_i
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort
C = gets.split.map(&:to_i).sort

bi_to_count = Hash.new { 0 }
prev_count = 0
B.reverse.each.with_index do |b, i|
  ci = C.bsearch_index { |c| c > b }
  count = ci.nil? ? 0 : N - ci
  bi_to_count[N - i - 1] = prev_count + count
  prev_count += count
end

ans = 0
A.each do |a|
  bi = B.bsearch_index { |b| b > a }
  next unless bi
  ans += bi_to_count[bi]
end
puts ans
