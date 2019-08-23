N = gets.to_i
edges = (N - 1).times.map { gets.split.map(&:to_i) }
cs = gets.split.map(&:to_i).sort_by { |n| -n }

graph = Array.new(N) { [] }
edges.each do |(u, v)|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end

def bfs(graph, cs, start)
  ans = Array.new(N)
  queue = [[start, -1]]
  i = 0
  while !queue.empty?
    u, parent = queue.shift
    ans[u] = cs[i]
    i += 1
    graph[u].each do |v|
      next if v == parent
      queue.push([v, u])
    end
  end
  ans
end

sum = cs[1..-1].reduce(0, &:+)
ans = bfs(graph, cs, 0)
puts sum
puts ans.join(' ')
