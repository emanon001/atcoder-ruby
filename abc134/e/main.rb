N = gets.to_i
A = N.times.map { gets.to_i }

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

list = []
A.each do |a|
  i = bsearch(ok: -1, ng: list.size) do |j|
    list[j] < a
  end
  if i == -1
    list.unshift(a)
  else
    list[i] = a
  end
end
puts list.size