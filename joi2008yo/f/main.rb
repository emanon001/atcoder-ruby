N, K = gets.split.map(&:to_i)

INF = 1 << 60
def shortest_path(graph, s)
  w_list = Array.new(graph.size, INF)
  w_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    u, w = queue.shift
    next if w > w_list[u]
    graph[u].each do |(v, c)|
      if w_list[v] > w_list[u] + c
        w_list[v] = w_list[u] + c
        queue.push([v, w_list[v]])
      end
    end
  end
  w_list
end

graph = Array.new(N) { [] }
K.times do
  query = gets.chomp.split
  if query[0].to_i == 0
    a = query[1].to_i - 1
    b = query[2].to_i - 1
    res = shortest_path(graph, a)
    if res[b] == INF
      puts -1
    else
      puts res[b]
    end
  else
    c = query[1].to_i - 1
    d = query[2].to_i - 1
    e = query[3].to_i
    graph[c].push([d, e])
    graph[d].push([c, e])
  end
end