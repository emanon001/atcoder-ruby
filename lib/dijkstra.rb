def dijkstra(s, graph)
  pq = PriorityQueue.new { |(_, d)| -d }
  d_list = Array.new(graph.size, 1 << 60)
  d_list[s] = 0
  pq.push([s, 0])
  while !pq.empty?
    v, d = pq.pop
    next if d > d_list[v]
    graph[v].each do |(u, c)|
      if d_list[u] > d_list[v] + c
        d_list[u] = d_list[v] + c
        pq.push([u, d_list[u]])
      end
    end
  end
  d_list
end
