N = gets.to_i
abs = (N - 1).times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
abs.each.with_index do |(a, b), i|
  a -= 1
  b -= 1
  graph[a].push([b, i])
  graph[b].push([a, i])
end

def dfs(graph, s)
  ans = Array.new(N - 1)
  queue = [[s, nil, nil]]
  while !queue.empty?
    u, parent, c = queue.shift
    new_c = 1
    graph[u].each do |(v, i)|
      next if v == parent
      new_c += 1 if new_c == c
      ans[i] = new_c
      queue.push([v, u, new_c])
      new_c += 1
    end
  end
  ans
end
ans = dfs(graph, 0)
count = ans.max
puts count
ans.each do |c|
  puts c
end
