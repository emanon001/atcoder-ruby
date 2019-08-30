N, M = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)

a_to_count = [2, 5, 5, 4, 5, 6, 3, 7, 6].map.with_index do |n, i|
  [i + 1, n]
end.to_h

match_counts = as.map { |a| a_to_count[a] }.uniq
match_count_a = match_counts.map do |c|
  max_a = as.select { |a| a_to_count[a] == c }.max
  [c, max_a]
end.sort_by { |c, a| -a }

dp = Array.new(N + 1, nil)
dp[0] = [0, Array.new(9, 0)]
(0..N).each do |i|
  count, list = dp[i]
  next unless list
  match_count_a.each do |(c, a)|
    next if i + c > N
    t = list.dup
    t[9 - a] += 1
    if dp[i + c] == nil || ([count + 1, t] <=> dp[i + c]) > 0
      dp[i + c] = [count + 1, t]
    end
  end
end
ans = dp[N][1].each.with_index.reduce('') do |acc, (count, i)|
  a = 9 - i
  acc += a.to_s * count
end
puts ans
