N, X = gets.split.map(&:to_i)
hs = gets.split.map(&:to_i)
edges = (N - 1).times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { [] }
edges.each do |(u, v)|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end

def dfs(graph, hs, u, parent)
  cost = 0
  has_h = hs[u] == 1
  graph[u].each do |v|
    next if v == parent
    c2, has_h2 = dfs(graph, hs, v, u)
    if has_h2
      cost += c2 + 1
      has_h = true
    end
  end
  [cost, has_h]
end

cost, has_h = dfs(graph, hs, X - 1, nil)
if has_h
  puts cost * 2
else
  puts 0
end
