N = gets.to_i
vs = gets.split.map(&:to_i)
sorted = vs.sort
(N - 1).times do
  n = (sorted[0] + sorted[1]) / 2.0
  if sorted.size == 2
    sorted = [n]
  else
    sorted = (sorted[2..-1] + [n]).sort
  end
end
puts sorted[0]
