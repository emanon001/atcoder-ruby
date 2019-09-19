n = gets.not_nil!.to_i
s = gets.not_nil!.chomp.chars

def zalgo(s : Array(Char), offset : Int32) : Array(Int32)
  size = s.size - offset
  ret = Array(Int32).new(size, 0)
  ret[0] = size
  i = 1
  j = 0
  while i < size
    while i + j < size && s[offset + j] == s[offset + i + j]
      j += 1
    end
    ret[i] = j
    if j == 0
      i += 1
      next
    end
    k = 1
    while i + k < size && k + ret[k] < j
      ret[i + k] = ret[k]
      k += 1
    end
    i += k
    j -= k
  end
  ret
end

ans = 0
(0...n).each do |i|
  lcp = zalgo(s, i)
  (1...(lcp.size)).each do |j|
    c = lcp[j]
    c = j if j < c
    ans = c if c > ans
  end
end
puts ans
