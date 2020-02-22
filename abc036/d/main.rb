class ModInt
  MOD = 10 ** 9 + 7

  attr_reader :n

  def initialize(n)
    @n = n % MOD
  end

  def +(other)
    if other.is_a?(ModInt)
      ModInt.new(@n + other.n)
    else
      ModInt.new(@n + other)
    end
  end

  def -(other)
    if other.is_a?(ModInt)
      ModInt.new(@n - other.n)
    else
      ModInt.new(@n - other)
    end
  end

  def *(other)
    if other.is_a?(ModInt)
      ModInt.new(@n * other.n)
    else
      ModInt.new(@n * other)
    end
  end

  def pow(t)
    return ModInt.new(1) if t == 0
    a = pow(t >> 1)
    a = a * a
    if t[0] == 1
      a = a * self
    end
    a
  end

  def inv
    pow(MOD - 2)
  end

  def /(other)
    if other.is_a?(ModInt)
      self * other.inv
    else
      self * ModInt.new(other).inv
    end
  end
end

N = gets.to_i
graph = Array.new(N) { [] }
(N - 1).times do
  a, b = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

def black(u, parent, graph, b_dp, w_dp)
  return b_dp[u] if b_dp[u]
  ret = ModInt.new(1)
  graph[u].each do |v|
    next if v == parent
    ret = ret * white(v, u, graph, b_dp, w_dp)
  end
  b_dp[u] = ret
end

def white(u, parent, graph, b_dp, w_dp)
  return w_dp[u] if w_dp[u]
  ret = ModInt.new(1)
  graph[u].each do |v|
    next if v == parent
    a = black(v, u, graph, b_dp, w_dp) + white(v, u, graph, b_dp, w_dp)
    ret = ret * a
  end
  w_dp[u] = ret
end

b_dp = Array.new(N)
w_dp = Array.new(N)
ans = black(0, nil, graph, b_dp, w_dp) + white(0, nil, graph, b_dp, w_dp)
puts ans.n