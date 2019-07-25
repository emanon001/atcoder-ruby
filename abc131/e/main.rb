N, K = gets.split.map(&:to_i)

max_pairs_count = (N - 1) * (N - 2) / 2
if K > max_pairs_count
  puts -1
  exit 0
end
ans = []
(1..(N - 1)).each do |i|
  ans.push([i, N])
end
candidates = []
(1..(N - 2)).each do |i|
  ((i + 1)..(N - 1)).each do |j|
    candidates.push([i, j])
  end
end
ans += candidates.take(max_pairs_count - K)
puts ans.size
ans.each do |(i, j)|
  puts "#{i} #{j}"
end
