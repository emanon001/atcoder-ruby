# use UnionFind
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