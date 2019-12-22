N = gets.to_i
if N.odd?
  puts 0
else
  c = 0
  a = 10
  while a <= N
    c += N / a
    a *= 5
  end
  puts c
end
