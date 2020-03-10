N, A, B = gets.split.map(&:to_i)
H = N.times.map { gets.to_i }

def bsearch(ng:, ok:, &is_ok)
  while (ok - ng).abs > 1
    mid = (ok + ng) / 2
    if is_ok.call(mid)
      ok = mid
    else
      ng = mid
    end
  end
  ok
end

def ok?(count)
  b_damage = B * count
  diff = A - B
  rest_count = count
  H.each do |h|
    rest_h = h - b_damage
    next if rest_h <= 0
    c = (rest_h + diff - 1) / diff
    if c > rest_count
      return false
    end
    rest_count -= c
  end
  true
end

ng = 0
ok = H.max
res = bsearch(ng: ng, ok: ok) { |n| ok?(n) }
puts res