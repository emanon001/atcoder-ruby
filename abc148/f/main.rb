N, U, V = gets.split.map(&:to_i)
edges = (N - 1).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
edges.each do |(a, b)|
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

def bfs(graph, start)
  depths = Array.new(N)
  # u, parent, depth
  queue = [[start, nil, 0]]
  while !queue.empty?
    u, parent, depth = queue.shift
    depths[u] = depth
    graph[u].each do |v|
      next if v == parent
      queue.push([v, u, depth + 1])
    end
  end
  depths
end

t_depths = bfs(graph, U - 1)
a_depths = bfs(graph, V - 1)

ans = 0
N.times do |i|
  if t_depths[i] <= a_depths[i]
    depth = a_depths[i] - 1
    ans = depth if depth > ans
  end
end
puts ans
