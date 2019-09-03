require 'set'
N = gets.to_i
orders = N.times.map do
  gets.split.map(&:to_i).map { |n| n - 1 }
end
games = Array.new(N) { 0 }
okpl_set = Set.new
ans = 0
while okpl_set.size < N do
  is_ok = false
  used = Set.new
  (0...N).each do |i|
    # puts '--------------------------'
    pl = i
    next if okpl_set.include?(pl)
    next if used.include?(pl)
    gi = games[pl]
    # p [pl, gi, games[gi]]
    order = orders[pl]
    vpl = order[gi]
    next if okpl_set.include?(vpl)
    next if used.include?(vpl)
    vorder = orders[vpl]
    vgi = games[vpl]
    # p [vpl, vgi, games[vgi]]
    if pl == vorder[vgi]
      # p [pl, vpl]
      is_ok = true
      used.add(pl)
      used.add(vpl)
      games[pl] += 1
      games[vpl] += 1
      okpl_set.add(pl) if games[pl] == N - 1
      okpl_set.add(vpl) if games[vpl] == N - 1
    end
  end
  unless is_ok
    puts -1
    exit 0
  end
  ans += 1
end
puts ans
