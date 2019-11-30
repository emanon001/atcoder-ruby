N = gets.to_i
digits = N.to_s.size
ans = 0
(1..digits).each do |d|
  a = 10 ** d
  b = 10 ** (d - 1)
  n = N / a
  m = N % a
  ans += n * b
  c = m / b
  if c > 1
    ans += b
  elsif c == 1
    ans += (m % b) + 1
  end
end
puts ans
