N, M = gets.split.map(&:to_i)
queries = M.times.map { gets.split.map(&:to_i) }

if M == 0
  puts 'Yes'
  exit 0
end

graph = Array.new(N) { [] }
queries.each do |(l, r, d)|
  l -= 1
  r -= 1
  graph[l].push([r, d])
  graph[r].push([l, -d])
end

def bfs(graph, s, visited)
  w_list = Array.new(graph.size, nil)
  w_list[s] = 0
  queue = [s]
  while !queue.empty?
    u = queue.shift
    visited[u] = true
    graph[u].each do |(v, w)|
      next if visited[v]
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

visited = {}
graph.each.with_index do |l, u|
  next if l.empty?
  next if visited[u]
  unless bfs(graph, u, visited)
    puts 'No'
    exit 0
  end
end
puts 'Yes'
