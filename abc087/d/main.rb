N, M = gets.split.map(&:to_i)
queries = M.times.map { gets.split.map(&:to_i) }

if M == 0
  puts 'Yes'
  exit 0
end

graph = Array.new(N) { [] }
indegree = Hash.new { 0 }
queries.each do |(l, r, d)|
  l -= 1
  r -= 1
  indegree[l] = 0
  indegree[r] += 1
  graph[l].push([r, d])
end

def has_cycle?(indegree, graph)
  queue = []
  indegree.each do |u, c|
    queue.push(u) if c == 0
  end
  count = queue.size
  while !queue.empty?
    u = queue.shift
    (graph[u]).each do |v|
      indegree[v] -= 1
      if indegree[v] == 0
        queue.push(v)
        count += 1
      end
    end
  end
  count == indegree.size
end

if has_cycle?(indegree, graph)
  puts 'No'
  exit 0
end

def bfs(graph, s)
  w_list = Array.new(graph.size, nil)
  w_list[s] = 0
  queue = [s]
  while !queue.empty?
    u = queue.shift
    graph[u].each do |(v, w)|
      if w_list[v] && w_list[u] + w != w_list[v]
        return false
      elsif w_list[v].nil?
        w_list[v] = w_list[u] + w
        queue.push(v)
      end
    end
  end
  true
end

indegree.each do |u, c|
  next unless c == 0
  unless bfs(graph, u)
    puts 'No'
    exit 0
  end
end
puts 'Yes'
