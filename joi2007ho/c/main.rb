N = gets.to_i
XY = N.times.map { gets.split.map(&:to_i) }

def area(xy1, xy2, xy_set)
  x1, y1 = xy1
  x2, y2 = xy2
  q = [x2 - y2 + y1, y2 + x2 - x1]
  r = [x1 - y2 + y1, y1 + x2 - x1]
  if xy_set.include?(q) && xy_set.include?(r)
    (x1 - x2) ** 2 + (y1 - y2) ** 2
  else
    nil
  end
end

require 'set'
xy_set = Set.new(XY)
ans = 0
XY.combination(2).each do |xy1, xy2|
  ret = area(xy1, xy2, xy_set)
  ans = ret if ret != nil && ret > ans
end
puts ans