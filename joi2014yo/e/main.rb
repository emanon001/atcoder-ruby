N, K = gets.split.map(&:to_i)
CR = N.times.map { gets.split.map(&:to_i) }
AB = K.times.map do
  a, b = gets.split.map(&:to_i)
  [a - 1, b - 1]
end
graph = Array.new(N) { [] }
AB.each do |a, b|
  graph[a].push(b)
  graph[b].push(a)
end

require 'set'
def reachable_vertexes(graph, s, max_c)
  set = Set.new([s])
  queue = [[s, 0]]
  while !queue.empty?
    u, c = queue.shift
    graph[u].each do |v|
      next if set.include?(v)
      new_c = c + 1
      next if new_c > max_c
      set.add(v)
      queue.push([v, new_c]) if new_c <= max_c
    end
  end
  set
end
reachable = Array.new(N)
CR.each.with_index do |(_, r), i|
  reachable[i] = reachable_vertexes(graph, i, r)
end

def shortest_path(reachable, s)
  w_list = Array.new(reachable.size, 1 << 60)
  w_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    u, w = queue.shift
    next if w > w_list[u]
    c = CR[u][0]
    reachable[u].each do |v|
      if w_list[u] + c < w_list[v]
        w_list[v] = w_list[u] + c
        queue.push([v, w_list[v]])
      end
    end
  end
  w_list
end

d = shortest_path(reachable, 0)
ans = d[N - 1]
puts ans