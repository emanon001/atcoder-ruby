N, M, S, T = gets.split.map(&:to_i)
edges = M.times.map do
  u, v, a, b = gets.split.map(&:to_i)
  [u - 1, v - 1, a, b]
end
yen_graph = Array.new(N) { [] }
snuuk_graph = Array.new(N) { [] }
edges.each do |u, v, a, b|
  yen_graph[u].push([v, a])
  yen_graph[v].push([u, a])
  snuuk_graph[u].push([v, b])
  snuuk_graph[v].push([u, b])
end

def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    u, w = queue.shift
    next if w > w_list[u]
    graph[u].each do |(v, c)|
      if w_list[u] + c < w_list[v]
        new_cost = w_list[u] + c
        w_list[v] = new_cost
        queue.push([v, new_cost])
      end
    end
  end
  w_list
end

yen_cost = shortest_path(yen_graph, S - 1)
snuuk_cost = shortest_path(snuuk_graph, T - 1)
cost_list = N.times.map { |i| yen_cost[i] + snuuk_cost[i] }
FIRST_YEN = 10 ** 15
current_cost = 1 << 60
ans = Array.new(N)
(N - 1).downto(0) do |i|
  current_cost = current_cost > cost_list[i] ? cost_list[i] : current_cost
  ans[i] = FIRST_YEN - current_cost
end
ans.each do |a|
  puts a
end