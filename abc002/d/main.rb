N, M = gets.split.map(&:to_i)
XY = M.times.map { gets.split.map(&:to_i) }

require 'set'
relations = Array.new(N) { Set.new }
XY.each do |x, y|
  x -= 1
  y -= 1
  relations[x].add(y)
  relations[y].add(x)
end

MAX = (1 << N) - 1
ans = 0
(0..MAX).each do |group|
  members = Set.new
  N.times do |i|
    if group[i] == 1
      members.add(i)
    end
  end
  is_ok = members.all? do |m|
    relation = relations[m]
    members.all? do |m2|
      m == m2 || relation.include?(m2)
    end
  end
  if is_ok
    ans = members.size if members.size > ans
  end
end
puts ans