M = gets.to_i
MXY = M.times.map { gets.split.map(&:to_i) }
N = gets.to_i
NXY = N.times.map { gets.split.map(&:to_i) }

require 'set'
n_set = Set.new(NXY)

N.times do |i|
  nx, ny = NXY[i]
  diff_x = nx - MXY[0][0]
  diff_y = ny - MXY[0][1]
  is_ok = (1...M).all? do |j|
    mx, my = MXY[j]
    n_set.include?([mx + diff_x, my + diff_y])
  end
  if is_ok
    puts "#{diff_x} #{diff_y}"
    exit 0
  end
end