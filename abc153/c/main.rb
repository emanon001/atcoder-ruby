N, K = gets.split.map(&:to_i)
H = gets.split.map(&:to_i)

if K >= N
  puts 0
  exit 0
end

sorted = H.sort_by { |h| -h }
list = sorted.drop(K)
ans = list.reduce(0, &:+)
puts ans