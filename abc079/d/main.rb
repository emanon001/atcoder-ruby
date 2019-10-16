H, W = gets.split.map(&:to_i)
graph = Array.new(10)
10.times do |i|
  graph[i] = gets.split.map.with_index do |ns, j|
    [j, ns.to_i]
  end.reject { |_, j| i == j }
end

board = H.times.map { gets.split.map(&:to_i) }
def shortest_path(s, graph)
  d_list = Array.new(graph.size, 1 << 60)
  d_list[s] = 0
  queue = [[s, 0]]
  while !queue.empty?
    v, d = queue.shift
    next if d > d_list[v]
    graph[v].each do |(u, c)|
      if d_list[u] > d_list[v] + c
        d_list[u] = d_list[v] + c
        queue.push([u, d_list[u]])
      end
    end
  end
  d_list
end

memo = Array.new(10)
ans = 0
board.each.with_index do |row, i|
  row.each do |n|
    next if n == -1
    next if n == 1
    memo[n] ||= shortest_path(n, graph)[1]
    ans += memo[n]
  end
end
puts ans
