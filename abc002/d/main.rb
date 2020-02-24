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

ans = 0
(1...(1 << N)).each do |state|
  members = N.times.select { |i| state[i] == 1 }
  is_ok = members.all? do |m|
    members.all? do |m2|
      m == m2 || relations[m].include?(m2)
    end
  end
  if is_ok
    c = members.size
    ans = c if c > ans
  end
end
puts ans