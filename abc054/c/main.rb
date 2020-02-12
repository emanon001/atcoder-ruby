N, M = gets.split.map(&:to_i)
edges = M.times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
edges.each do |u, v|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end

require 'set'
def path_count(u, visited, graph)
  return 1 if visited.size == N
  ret = 0
  graph[u].each do |v|
    next if visited.include?(v)
    new_visited = visited | Set.new([v])
    ret += path_count(v, new_visited, graph)
  end
  ret
end
visited = Set.new([0])
ans = path_count(0, visited, graph)
puts ans