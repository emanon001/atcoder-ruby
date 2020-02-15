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

N, K, L = gets.split.map(&:to_i)

P = K.times.map { gets.split.map(&:to_i) }
R = L.times.map { gets.split.map(&:to_i) }

uf1 = UnionFind.new(N)
P.each do |a, b|
  a -= 1
  b -= 1
  uf1.unite(a, b)
end
uf2 = UnionFind.new(N)
R.each do |a, b|
  a -= 1
  b -= 1
  uf2.unite(a, b)
end

count_table = Hash.new { 0 }
N.times do |n|
  a = uf1.find(n)
  b = uf2.find(n)
  count_table[[a, b]] += 1
end
ans = N.times.map do |n|
  a = uf1.find(n)
  b = uf2.find(n)
  count_table[[a, b]]
end.join(' ')
puts ans