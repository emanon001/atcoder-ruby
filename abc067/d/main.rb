N = gets.to_i
edges = (N - 1).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
edges.each do |(u, v)|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end

INF = 1 << 60
def bfs(graph, s, wall)
  ds = Array.new(N, INF)
  queue = [[s, nil, 0]] # u, parent, depth
  while !queue.empty?
    u, parent, depth = queue.shift
    ds[u] = depth
    graph[u].each do |v|
      next if v == parent
      next if v == wall
      queue.push([v, u, depth + 1])
    end
  end
  ds
end

fds = bfs(graph, 0, N - 1)
sds = bfs(graph, N - 1, 0)
f_count = 0
s_count = 0
fds.zip(sds) do |(fd, sd)|
  if fd <= sd
    f_count += 1
  else
    s_count += 1
  end
end
if f_count > s_count
  puts 'Fennec'
else
  puts 'Snuke'
end
