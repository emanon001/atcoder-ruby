A, B, C, K = gets.split.map(&:to_i)
if K.odd?
  puts B - A
else
  puts A - B
end
