N, K = gets.split.map(&:to_i)

if K == 0
  puts N * N
  exit 0
end

ans = 0
(1..N).each do |b|
  n = [b - K, 0].max
  c1 = N / b * n
  c2 = [N % b + 1 - K, 0].max
  ans += c1 + c2
end
puts ans
