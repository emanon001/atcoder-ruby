N, M = gets.split.map(&:to_i)
edge_list = (N - 1 + M).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
indegree = Array.new(N) { 0 }
edge_list.each do |(u, v)|
  u -= 1; v -= 1
  graph[u].push(v)
  indegree[v] += 1
end

sorted = []
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
      sorted.push(v)
    end
  end
end

v_to_order = sorted.map.with_index { |v, i| [v, i] }.to_h
ans = Array.new(N) { sorted[0] }
ans[sorted[0]] = 0
edge_list.each do |(u, v)|
  u -= 1
  v -= 1
  ans[v] = u if v_to_order[u] > v_to_order[ans[v]]
end
ans.each.with_index do |v, i|
  if i == sorted[0]
    puts 0
  else
    puts(v + 1)
  end
end
