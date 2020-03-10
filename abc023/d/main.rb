N = gets.to_i
HS = N.times.map { gets.split.map(&:to_i) }

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

def ok?(n)
  table = Hash.new { 0 }
  HS.each do |h, s|
    return false if h > n
    c = (n - h) / s
    table[c] += 1
  end
  destroyed_count = -1
  table.keys.sort.each do |s|
    c = table[s]
    return false if s - destroyed_count < c
    destroyed_count += c
  end
  true
end

ng = 0
ok = (10 ** 9) + (10 ** 9) * (10 ** 5) + 1
res = bsearch(ng: ng, ok: ok) { |n| ok?(n) }
puts res