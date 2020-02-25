N = gets.to_i
XY = N.times.map { gets.split.map(&:to_i) }
sum = 0.0
(0...N).to_a.permutation.each do |path|
  sum += path.each_cons(2).reduce(0) do |acc, (u, v)|
    acc + Math.sqrt((XY[u][0] - XY[v][0]) ** 2 + (XY[u][1] - XY[v][1]) ** 2)
  end
end
ans = sum / (1..N).reduce(:*)
puts ans