N = gets.to_i
abcs = (N - 1).times.map { gets.split.map(&:to_i) }
Q, K = gets.split.map(&:to_i)
xys = Q.times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { [] }
abcs.each do |(a, b, c)|
  a -= 1
  b -= 1
  graph[a].push([b, c])
  graph[b].push([a, c])
end

def bfs(s, graph)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = [[s, 0, -1]]
  while !queue.empty?
    v, w, parent = queue.shift
    w_list[v] = w
    graph[v].each do |(u, w2)|
      next if u == parent
      queue.push([u, w + w2, v])
    end
  end
  w_list
end

w_list = bfs(K - 1, graph)
xys.each do |(x, y)|
  x -= 1
  y -= 1
  ans = w_list[x] + w_list[y]
  puts ans
end
