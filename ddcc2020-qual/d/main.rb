M = gets.to_i
dcs = M.times.map { gets.split.map(&:to_i) }
count = 0
dcs.reduce(0) do |acc, (d, c)|
  ns = ([acc] + [d] * c)
  while ns.size > 1
    count += 1
    ret = (ns[0] + ns[1]).to_s.chars.map(&:to_i)
    if ret.size == 2
      ns[0] = ret[0]
      ns[1] = ret[1]
    else
      ns.shift
      ns[0] = ret[0]
    end
  end
  ns[0]
end
puts count - 1
