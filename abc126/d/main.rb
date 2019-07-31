N = gets.to_i
uvw_list = (N - 1).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
uvw_list.each do |(u, v, w)|
  u -= 1
  v -= 1
  graph[u].push([v, w])
  graph[v].push([u, w])
end

def bfs(graph)
  w_list = Array.new(N)
  queue = [[0, 0, nil]] # u, w, parent
  while !queue.empty?
    u, w, parent = queue.shift
    w_list[u] = w
    graph[u].each do |(v, w2)|
      next if v == parent
      queue.push([v, w + w2, u])
    end
  end
  w_list
end

w_list = bfs(graph)
w_list.map do |w|
  puts(w.even? ? '0' : '1')
end
