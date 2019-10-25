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

N, M = gets.split.map(&:to_i)
ps = gets.split.map(&:to_i)
xys = M.times.map { gets.split.map(&:to_i) }

uf = UnionFind.new(N + 1)
xys.each do |(x, y)|
  uf.unite(x, y)
end
ans = 0
ps.each.with_index do |n, i|
  i += 1
  if n == i || uf.same?(i, n)
    ans += 1
  end
end
puts ans
