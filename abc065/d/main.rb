class UnionFind
  def initialize(n)
    @root = Array.new(n)
    @rank = Array.new(n)
    @size = Array.new(n)
    (0...n).each do |i|
      @root[i] = i
      @rank[i] = 0
      @size[i] = 1
    end
  end

  def find(x)
    if @root[x] == x
      x
    else
      @root[x] = find(@root[x])
    end
  end

  def unite(x, y)
    x_root = find(x)
    y_root = find(y)
    return if x_root == y_root

    if @rank[x_root] < @rank[y_root]
      @root[x_root] = y_root
      @size[y_root] += @size[x_root]
    else
      @root[y_root] = x_root
      @size[x_root] += @size[y_root]
      if @rank[x_root] == @rank[y_root]
        @rank[x_root] += 1
      end
    end
    nil
  end

  def size(x)
    x_root = find(x)
    @size[x_root]
  end

  def same?(x, y)
    find(x) == find(y)
  end
end

N = gets.to_i
points = N.times.map do |i|
  x, y = gets.split.map(&:to_i)
  [i, x, y]
end

edges = Array.new((N - 1) * 2)
x_sorted = points.sort_by { |_, x, _| x }
y_sorted = points.sort_by { |_, _, y| y }
(N - 1).times do |n|
  i, x, _ = x_sorted[n]
  j, x2, _ = x_sorted[n + 1]
  yen = (x - x2).abs
  edges[n] = [i, j, yen]
end
(N - 1).times do |n|
  i, _, y = y_sorted[n]
  j, _, y2 = y_sorted[n + 1]
  yen = (y - y2).abs
  edges[(N - 1) + n] = [i, j, yen]
end

def kruskal(n, edges)
  edges.sort_by! { |_, _, c| c }
  uf = UnionFind.new(n)
  ret = 0
  edges.each do |u, v, c|
    if !uf.same?(u, v)
      uf.unite(u, v)
      ret += c
    end
  end
  ret
end

puts kruskal(N, edges)