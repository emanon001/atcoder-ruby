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