N, M, L = gets.split.map(&:to_i)
abcs = M.times.map { gets.split.map(&:to_i) }
Q = gets.to_i
sts = Q.times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { [] }
abcs.each do |(a, b, c)|
  a -= 1
  b -= 1
  graph[a].push([b, c])
  graph[b].push([a, c])
end

def bfs(graph, s, e)
  queue = [[s, -1, 0, L]]
  while !queue.empty?
    u, parent, count, rest = queue.shift
    return count if u == e
    graph[u].each do |(v, c)|
      next if v == parent
      next if c > L
      new_count, new_rest = if rest >= c
        [count, rest - c]
      else
        [count + 1, L - c]
      end
      queue.push([v, u, new_count, new_rest])
    end
  end
  return -1
end

sts.each do |(u, v)|
  u -= 1
  v -= 1
  ans = bfs(graph, u, v)
  puts ans
end
