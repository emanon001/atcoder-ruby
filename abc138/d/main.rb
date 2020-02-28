N, Q = gets.split.map(&:to_i)
graph = Array.new(N) { [] }
(N - 1).times do
  u, v = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end
counters = Array.new(N, 0)
Q.times do
  u, x = gets.split.map(&:to_i)
  u -= 1
  counters[u] += x
end

def bfs(graph, counters)
  res = Array.new(N, 0)
  res[0] = counters[0]
  queue = [[0, nil]]
  while !queue.empty?
    u, parent = queue.shift
    c = res[u]
    graph[u].each do |v|
      next if v == parent
      new_c = c + counters[v]
      res[v] = new_c
      queue.push([v, u])
    end
  end
  res
end

res = bfs(graph, counters)
puts res.join(' ')
