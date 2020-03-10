A, B, X = gets.split.map(&:to_i)

def d(n)
  n.to_s.size
end

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
ng = 10 ** 9 + 1
ok = 0
res = bsearch(ng: ng, ok: ok) do |n|
  A * n + B * d(n) <= X
end
puts [res, ng - 1].min