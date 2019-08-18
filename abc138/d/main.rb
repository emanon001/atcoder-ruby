N, Q = gets.split.map(&:to_i)
edges = (N - 1).times.map { gets.split.map(&:to_i) }
queries = Q.times.map { gets.split.map(&:to_i) }

graph = Array.new(N) { [] }
edges.each do |(u, v)|
  u -= 1
  v -= 1
  graph[u].push(v)
  graph[v].push(u)
end
table = Array.new(N) { 0 }
queries.each do |(u, x)|
  u -= 1
  table[u] += x
end

queue = [[0, nil]]
while !queue.empty?
  u, parent = queue.shift
  n = table[u]
  graph[u].each do |v|
    next if v == parent
    table[v] += n
    queue.push([v, u])
  end
end

ans = N.times.map do |n|
  table[n]
end.join(' ')
puts ans
