N = gets.to_i
xy_list = (N - 1).times.map { gets.split.map(&:to_i) }
Q = gets.to_i
ab_list = Q.times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { [] }
xy_list.each do |(x, y)|
  x -= 1
  y -= 1
  graph[x].push(y)
  graph[y].push(x)
end

def bfs(graph, max_k)
  parent_list = Array.new(max_k + 1) { Array.new(N) }
  depth_list = Array.new(N)
  queue = [[0, nil, 0]]
  while !queue.empty?
    v, parent, depth = queue.shift
    parent_list[0][v] = parent
    depth_list[v] = depth
    graph[v].each do |u|
      next if u == parent
      queue.push([u, v, depth + 1])
    end
  end
  [parent_list, depth_list]
end

def lca(u, v, parent_list, depth_list, max_k)
  d1 = depth_list[u]
  d2 = depth_list[v]
  u, v = d1 > d2 ? [v, u] : [u, v]
  # lca
  (0..max_k).each do |k|
    depth_diff = depth_list[v] - depth_list[u]
    if depth_diff[k] == 1
      v = parent_list[k][v]
    end
  end
  return u if u == v
  max_k.downto(0) do |k|
    if parent_list[k][u] != parent_list[k][v]
      u = parent_list[k][u]
      v = parent_list[k][v]
    end
  end
  parent_list[0][u]
end

max_k = Math.log2(N).to_i
parent_list, depth_list = bfs(graph, max_k)
(0..(max_k - 1)).each do |k|
  N.times do |v|
    parent_list[k + 1][v] = if parent_list[k][v]
      parent_list[k][parent_list[k][v]]
    else
      nil
    end
  end
end
ab_list.each do |(a, b)|
  a -= 1
  b -= 1
  parent = lca(a, b, parent_list, depth_list, max_k)
  parent_depth = depth_list[parent]
  ans = (depth_list[a] - parent_depth) + (depth_list[b] - parent_depth) + 1
  puts ans
end
