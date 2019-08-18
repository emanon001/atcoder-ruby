N = gets.to_i
as = gets.split.map(&:to_i)

n = as.map { |a| 1.0 / a }.reduce(&:+)
ans = 1.0 / n
puts ans
