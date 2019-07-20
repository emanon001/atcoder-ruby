N, M, T = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
abc_list = M.times.map { gets.split.map(&:to_i) }
graph1 = Array.new(N) { Array.new }
graph2 = Array.new(N) { Array.new }
abc_list.each do |(a, b, c)|
  a -= 1
  b -= 1
  graph1[a].push([b, c])
  graph2[b].push([a, c])
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

d_list1 = dijkstra(0, graph1)
d_list2 = dijkstra(0, graph2)
ans = 0
(0...N).each do |i|
  rest = T - (d_list1[i] + d_list2[i])
  n = rest * a_list[i]
  ans = n if n > ans
end
puts ans
