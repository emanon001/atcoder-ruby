mod = Int64.new(10 ** 9 + 7)
n, k = gets.not_nil!.split.map(&.to_i)
edge_list = (n - 1).times.map { gets.not_nil!.split.map(&.to_i) }
graph = Array.new(n) { Array(Int32).new }
edge_list.each do |(a, b)|
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

def dfs(graph, k, mod, v, parent) : Int64
  color_count = if parent
    k - 2
  else
    k - 1
  end
  return Int64.new(0) if color_count < graph[v].size - (parent ? 1 : 0)
  ans = Int64.new(1)
  n = color_count
  graph[v].each do |u|
    next if u == parent
    ans = ans * n % mod
    n -= 1
  end
  graph[v].each do |u|
    next if u == parent
    ans = ans * dfs(graph, k, mod, u, v) % mod
  end
  ans
end
ans = Int64.new(k) * dfs(graph, k, mod, 0, nil) % mod
puts ans
