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

N, M, K = gets.split.map(&:to_i)
AB = M.times.map { gets.split.map(&:to_i) }
CD = K.times.map { gets.split.map(&:to_i) }

require 'set'
friends = Array.new(N + 1, 0)
blocks = Array.new(N + 1) { Set.new }
uf = UnionFind.new(N + 1)
AB.each do |a, b|
  uf.unite(a, b)
  friends[a] += 1
  friends[b] += 1
end
CD.each do |c, d|
  blocks[c].add(d)
  blocks[d].add(c)
end

ans = Array.new(N)
N.times do |i|
  a = i + 1
  fc = friends[a]
  all = uf.size(a)
  c = all - fc - 1
  blocks[a].each do |b|
    c -= 1 if uf.same?(a, b)
  end
  ans[i] = c
end
puts ans.join(' ')