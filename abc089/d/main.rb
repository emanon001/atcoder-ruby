H, W, D = gets.split.map(&:to_i)
board = H.times.map { gets.split.map(&:to_i) }
Q = gets.to_i
lrs = Q.times.map { gets.split.map(&:to_i) }

n_to_cell = {}
board.each.with_index do |row, i|
  row.each.with_index do |n, j|
    n_to_cell[n] = [i, j]
  end
end
costs = Array.new(H * W + 1) { 0 }
D.times do |n|
  n += 1
  cost = 0
  i = nil
  j = nil
  n.step(by: D, to: H * W) do |m|
    x, y = n_to_cell[m]
    if i && j
      cost += (x - i).abs + (y - j).abs
    end
    costs[m] = cost
    i = x
    j = y
  end
end

lrs.each do |(l, r)|
  ans = costs[r] - costs[l]
  puts ans
end
