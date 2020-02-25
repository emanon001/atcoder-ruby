N, K = gets.split.map(&:to_i)

A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort

def ok?(n, k)
  c = 0
  N.times do |ai|
    a = A[ai]
    bi = B.bsearch_index do |b|
      a * b >= n
    end
    if bi
      c += bi
    else
      c += B.size
    end
    return true if c >= k 
  end
  false
end

l = 0
r = 10 ** 18 + 1
ans = 10 ** 18 + 1
while l < r
  mid = (l + r) / 2
  if ok?(mid, K)
    r = mid
    ans = mid if mid < ans
  else
    l = mid + 1
  end
end
puts ans - 1