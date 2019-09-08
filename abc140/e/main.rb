N = gets.to_i
ps = gets.split.map(&:to_i).sort
ans = 0
n = N * (N - 1) / 2
ans = n
i = 0
(N - 2 - 1).times do
  n -= ps[i]
  ans += n
  i += 1
end
puts ans
