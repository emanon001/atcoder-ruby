N, M = gets.split.map(&:to_i)
edge_list = M.times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
indegree = Array.new(N) { 0 }
edge_list.each do |(u, v)|
  u -= 1; v -= 1
  graph[u].push(v)
  indegree[v] += 1
end

dp = Array.new(N) { 0 }
queue = []
indegree.each.with_index do |c, v|
  queue.push(v) if c == 0
end
while !queue.empty?
  v = queue.shift
  (graph[v]).each do |v2|
    indegree[v2] -= 1
    if indegree[v2] == 0
      queue.push(v2)
      dp[v2] = dp[v] + 1 if dp[v] + 1 > dp[v2]
    end
  end
end

ans = dp.max
puts ans
