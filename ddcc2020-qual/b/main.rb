N = gets.to_i
as = gets.split.map(&:to_i)
sum = as.reduce(&:+)
sums = Array.new(N)
current = 0
as.each.with_index do |a, i|
  current += a
  sums[i] = current
end

ans = 1 << 60
sums[0...-1].each.with_index do |psum, i|
  # c = i + 1
  b = (sum - psum).abs
  diff = (psum - b).abs
  ans = diff if diff < ans
end
puts ans
