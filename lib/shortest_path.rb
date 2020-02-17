# use PriorityQueue
def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new do |_, c|
    -c
  end
  queue.push([s, 0])
  while !queue.empty?
    u, w = queue.pop
    next if w > w_list[u]
    graph[u].each do |v, c|
      if w_list[u] + c < w_list[v]
        new_cost = w_list[u] + c
        w_list[v] = new_cost
        queue.push([v, new_cost])
      end
    end
  end
  w_list
end

# def shortest_path(graph, s)
#   w_list = Array.new(graph.size, 1 << 60)
#   w_list[s] = 0
#   queue = [[s, 0]]
#   while !queue.empty?
#     u, w = queue.shift
#     next if w > w_list[u]
#     graph[u].each do |(v, c)|
#       if w_list[v] > w_list[u] + c
#         w_list[v] = w_list[u] + c
#         queue.push([v, w_list[v]])
#       end
#     end
#   end
#   w_list
# end