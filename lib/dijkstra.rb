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
