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

N, Q = gets.split.map(&:to_i)
queries = Q.times.map do
  gets.split.map(&:to_i)
end

uf = UnionFind.new(N)
queries.each do |q, a, b|
  if q == 0
    uf.unite(a, b)
  else
    puts(uf.same?(a, b) ? 'Yes' : 'No')
  end
end