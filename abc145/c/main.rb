N = gets.to_i
xys = N.times.map { gets.split.map(&:to_i) }

def dfs(cand, pos, sum)
  return sum if cand.empty?
  x1, y1 = pos
  cand.reduce(0) do |acc, pos2|
    tmp = cand.dup
    tmp.delete(pos2)
    x2, y2 = pos2
    d = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
    acc += dfs(tmp, pos2, sum + d)
  end
end

sum = 0.to_f
xys.each do |pos|
  tmp = xys.dup
  tmp.delete(pos)
  sum += dfs(tmp, pos, 0)
end
ans = sum / (1..N).reduce(:*)
puts ans
