def prim(graph, s)
  require 'set'
  used = Set.new
  queue = PriorityQueue.new do |_, c|
    -c
  end
  queue.push([s, 0])
  ret = 0
  while !queue.empty?
    u, w = queue.pop
    next if used.include?(u)
    used.add(u)
    ret += w
    graph[u].each do |v, c|
      next if used.include?(v)
      queue.push([v, c])
    end
  end
  ret
end