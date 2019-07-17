N, M, S, T = gets.split.map(&:to_i)
uvab_list = M.times.map { gets.split.map(&:to_i) }
MONEY = 10 ** 15
yen_graph = Array.new(N) { Array.new }
snuke_graph = Array.new(N) { Array.new }
uvab_list.each do |(u, v, a, b)|
  u -= 1
  v -= 1
  yen_graph[u].push([v, a])
  yen_graph[v].push([u, a])
  snuke_graph[u].push([v, b])
  snuke_graph[v].push([u, b])
end

def dijkstra(s, graph)
  d_list = Array.new(graph.size, 1 << 60)
  d_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    v, d = queue.shift
    next if d > d_list[v]
    graph[v].each do |(u, c)|
      if d_list[u] > d_list[v] + c
        d_list[u] = d_list[v] + c
        queue.push([u, d_list[u]])
      end
    end
  end
  d_list
end

yen_cost_list = dijkstra(S - 1, yen_graph)
snuke_cost_list = dijkstra(T - 1, snuke_graph)
cost_list = yen_cost_list.zip(snuke_cost_list).map { |y, s| y + s }
ans_list = Array.new(N)
ans_list[N - 1] = MONEY - cost_list[N - 1]
(N - 2).downto(0).each do |i|
  n = MONEY - cost_list[i]
  ans_list[i] = if n > ans_list[i + 1]
    n
  else
    ans_list[i + 1]
  end
end
ans_list.each { |ans| puts ans }
