n = gets.not_nil!.to_i
orders = n.times.map do
  Deque.new(gets.not_nil!.split.map(&.to_i).map { |n| n - 1 }.to_a)
end.to_a
okpl_set = Set(Int32).new(n)
ans = 0
while okpl_set.size < n
  is_ok = false
  used = Set(Int32).new(n)
  (0...n).each do |i|
    pl = i
    next if okpl_set.includes?(pl)
    next if used.includes?(pl)
    order = orders[pl]
    vpl = order[0]
    next if okpl_set.includes?(vpl)
    next if used.includes?(vpl)
    vorder = orders[vpl]
    if pl == vorder[0]
      is_ok = true
      used.add(pl)
      used.add(vpl)
      order.shift
      vorder.shift
      okpl_set.add(pl) if order.empty?
      okpl_set.add(vpl) if vorder.empty?
    end
  end
  unless is_ok
    puts -1
    exit 0
  end
  ans += 1
end
puts ans
