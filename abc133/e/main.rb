MOD = 10 ** 9 + 7
N, K = gets.split.map(&:to_i)
edge_list = (N - 1).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
edge_list.each do |(a, b)|
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

def bfs(graph, v, parent)
  color_count = if parent
    K - 2
  else
    K - 1
  end
  return 0 if color_count < graph[v].size - (parent ? 1 : 0)
  ans = 1
  n = color_count
  graph[v].each do |u|
    next if u == parent
    ans *= n % MOD
    n -= 1
  end
  graph[v].each do |u|
    next if u == parent
    ans *= dfs(graph, u, v) % MOD
  end
  ans
end
puts K * dfs(graph, 0, nil) % MOD
