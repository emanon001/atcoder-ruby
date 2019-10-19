N, Q = gets.split.map(&:to_i)
edges = (N - 1).times.map { gets.split.map(&:to_i) }
queries = Q.times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { Array.new }
edges.each do |(u, v)|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end

points = Array.new(N, 0)
queries.each do |u, x|
  points[u - 1] += x
end

def bfs(graph, s, points)
  ret = Array.new(N, 0)
  queue = [[s, -1, 0]]
  while !queue.empty?
    u, parent, parent_point = queue.shift
    ret[u] = points[u] + parent_point
    graph[u].each do |v|
      next if v == parent
      queue.push([v, u, ret[u]])
    end
  end
  ret
end

counters = bfs(graph, 0, points)
ans = counters.join(' ')
puts ans
