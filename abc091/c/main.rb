N = gets.to_i
AB = N.times.map { gets.split.map(&:to_i) }
CD = N.times.map { gets.split.map(&:to_i) }

require 'set'
can_use = Array.new(N) { Set.new }
N.times do |i|
  a, b = AB[i]
  N.times do |j|
    c, d = CD[j]
    if a < c && b < d
      can_use[i].add(j)
    end
  end
end
# p can_use
ans = 0
N.times do
  can_use.reject! { |s| s.empty? }
  break if can_use.empty?
  can_use.sort_by! { |s| s.size }
  set = can_use.shift
  # p [set, can_use]
  first = set.first
  can_use.each do |s|
    s.delete(first)
  end
  ans += 1
end
puts ans