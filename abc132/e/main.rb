N, M = gets.split.map(&:to_i)
uv_list = M.times.map { gets.split.map(&:to_i) }
S, T = gets.split.map(&:to_i)

node_list = Array.new(N)
uv_list.each do |(u, v)|
  node_list[u] ||= []
  node_list[u].push(v)
end

visit = {}
queue = [[S, 0]]
INF = 2 << 60
min = INF
while !queue.empty?
  a, d = queue.shift
  if visit[[a, d % 3]] && visit[[a, d % 3]] <= d / 3
    next
  end
  visit[[a, d % 3]] = d / 3
  if d % 3 == 0 && a == T
    min = d if d < min
    next
  end
  next_d = d + 1
  (node_list[a] || []).each do |v|
    queue.push([v, next_d])
  end
end
puts(min == INF ? -1 : min / 3)
