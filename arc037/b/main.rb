N, M = gets.split.map(&:to_i)
edges = M.times.map do
  u, v = gets.split.map(&:to_i)
  [u - 1, v - 1]
end
graph = Array.new(N) { [] }
edges.each do |u, v|
  graph[u].push(v)
  graph[v].push(u)
end

def tree?(graph, start, visited)
  # [[u, parent], ...]
  queue = [[start, nil]]
  while !queue.empty?
    u, parent = queue.shift
    graph[u].each do |v|
      next if v == parent
      return false if visited[v]
      visited[v] = true
      queue.push([v, u])
    end
  end
  true
end

ans = 0
visited = Array.new(N, false)
N.times do |i|
  if !visited[i]
    ans += 1 if tree?(graph, i, visited)
  end
end
puts ans