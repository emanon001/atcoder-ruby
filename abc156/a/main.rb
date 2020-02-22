N, R = gets.split.map(&:to_i)

if N >= 10
  puts R
else
  ans = R + (10 - N) * 100
  puts ans
end