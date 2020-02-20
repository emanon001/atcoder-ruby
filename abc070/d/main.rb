N = gets.to_i
graph = Array.new(N) { [] }
(N - 1).times do
  a, b, c = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  graph[a].push([b, c])
  graph[b].push([a, c])
end
Q, K = gets.split.map(&:to_i)
queries = Q.times.map do
  x, y = gets.split.map(&:to_i)
  [x - 1, y - 1]
end

def distance(graph, s)
  d = Array.new(N)
  queue = [[s, nil, 0]]
  while !queue.empty?
    u, parent, distance = queue.shift
    graph[u].each do |v, c|
      next if v == parent
      new_distance = distance + c
      d[v] = new_distance
      queue.push([v, u, new_distance])
    end
  end
  d
end

d = distance(graph, K - 1)
queries.each do |u, v|
  ans = d[u] + d[v]
  puts ans
end