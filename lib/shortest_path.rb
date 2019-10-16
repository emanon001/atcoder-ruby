def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    v, w = queue.shift
    next if w > w_list[v]
    graph[v].each do |(u, c)|
      if w_list[u] > w_list[v] + c
        w_list[u] = w_list[v] + c
        queue.push([u, w_list[u]])
      end
    end
  end
  w_list
end
