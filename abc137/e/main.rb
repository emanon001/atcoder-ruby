require 'set'

N, M, P = gets.split.map(&:to_i)
abc_list = M.times.map do
  a, b, c = gets.split.map(&:to_i)
  [a - 1, b - 1, -(c - P)]
end
graph = Array.new(N) { [] }
abc_list.each do |(a, b, c)|
  graph[a].push([b, c])
end
reverse_graph = Array.new(N) { [] }
abc_list.each do |(a, b, c)|
  reverse_graph[b].push([a, c])
end

INF = 1 << 60

def reachable(graph, s)
  visit = Set.new
  visit.add(s)
  queue = [s]
  while !queue.empty?
    u = queue.shift
    graph[u].each do |(v, _)|
      next if visit.include?(v)
      visit.add(v)
      queue.push(v)
    end
  end
  visit
end

def bellman_ford(edge_list, s, max_count)
  d = Array.new(N, INF)
  d[s] = 0
  c = 0
  loop do
    is_update = false
    edge_list.each do |(u, v, c)|
      if d[u] != INF && d[u] + c < d[v]
        d[v] = d[u] + c
        is_update = true
      end
    end
    return d if !is_update
    c += 1
    return nil if c == max_count
  end
end

reachable_from_0 = reachable(graph, 0)
reachable_to_n = reachable(reverse_graph, N - 1)
v_set = Set.new
N.times do |v|
  v_set.add(v) if reachable_from_0.include?(v) && reachable_to_n.include?(v)
end
edge_list = abc_list.select do |(a, b, _)|
  v_set.include?(a) && v_set.include?(b)
end
ans = bellman_ford(edge_list, 0, v_set.size)
puts(ans == nil ? '-1' : [-(ans[N - 1]), 0].max)
